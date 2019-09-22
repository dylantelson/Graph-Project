//
//  ViewController.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/9/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

import UIKit

struct Stock: Decodable {
    let date: String
    let open: Float
    let close: Float
    let high: Float
    let low: Float
    let volume: Float
    let uOpen: Float
    let uClose: Float
    let uHigh: Float
    let uLow: Float
    let uVolume: Float
    let change: Float
    let changePercent: Float
    let label: String
    let changeOverTime: Float
}

class ViewController: UIViewController {
    
    
    var counterForJSON = 0
    var counterForJSON2 = 0
    
    let urlList = ["https://cloud.iexapis.com/stable/stock/aapl/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/msft/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/csco/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/c/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/ndaq/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/amd/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/uber/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/fb/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        //JSON Parsing with help from https://www.youtube.com/watch?v=9iazQQdNoNU by Lets Build That App
        while(counterForJSON < urlList.count) {
            fetchAAPLJSON { (stocks, err) in
                if let err = err {
                    print("Failure", err)
                    return
                }
                
                stocks?.forEach({ (stock) in
                    print(stock.close)
                    Points.myPoints[self.counterForJSON2].append(stock.close)
                })
            }
            counterForJSON+=1
        }
        
        while(Points.myPoints[0].count < 6 || Points.myPoints[1].count < 6 || Points.myPoints[2].count < 6 || Points.myPoints[3].count < 6 || Points.myPoints[4].count < 6 || Points.myPoints[5].count < 6 || Points.myPoints[6].count < 6 || Points.myPoints[7].count < 6) {
            
        }
        
        Points.myPoints.sort { $1[0] < $0[0] }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let myLine = Line(frame: CGRect(x: UIScreen.main.bounds.width/4 - 25, y: UIScreen.main.bounds.height/4 - 25, width: UIScreen.main.bounds.width/2 + 50, height: UIScreen.main.bounds.height/2 + 50))
            self.view.addSubview(myLine)
            let myLegend = Legend(frame: CGRect(x: UIScreen.main.bounds.width/20, y: UIScreen.main.bounds.height/3.5, width: UIScreen.main.bounds.width/5.75, height: UIScreen.main.bounds.height/2))
            self.view.addSubview(myLegend)
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    fileprivate func fetchAAPLJSON(completion: @escaping ([Stock]?, Error?) ->
        ()) {
        
        
        let urlString = urlList[self.counterForJSON]
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with:url) { (data, response, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            //If successful
            do {
                let stocks = try JSONDecoder().decode([Stock].self, from: data!)
                completion(stocks, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
            //Companies.myComps[self.counterForJSON2] = currCounter
            self.counterForJSON2 += 1
        }.resume()
    }


}

