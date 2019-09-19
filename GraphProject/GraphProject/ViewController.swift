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
    
    let urlList = ["https://cloud.iexapis.com/stable/stock/aapl/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/msft/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/ge/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/bac/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/ndaq/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/aon/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/bcyc/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/fb/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let myLine = Line(frame: CGRect(x: UIScreen.main.bounds.width/4 - 25, y: UIScreen.main.bounds.height/4 - 25, width: UIScreen.main.bounds.width/2 + 50, height: UIScreen.main.bounds.height/2 + 50))
                self.view.addSubview(myLine)
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
            self.counterForJSON2 += 1
        }.resume()
    }
    
//    fileprivate func fetchMSFTJSON(completion: @escaping ([Stock]?, Error?) ->
//        ()) {
//
//
//        let urlString2 = "https://cloud.iexapis.com/stable/stock/msft/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
//
//        guard let url2 = URL(string: urlString2) else {
//            return }
//
//        URLSession.shared.dataTask(with:url2) { (data, response, err) in
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            //If successful
//            do {
//                let stocks = try JSONDecoder().decode([Stock].self, from: data!)
//                completion(stocks, nil)
//            } catch let jsonError {
//                completion(nil, jsonError)
//            }
//
//        }.resume()
//    }
//
//    fileprivate func fetchGEJSON(completion: @escaping ([Stock]?, Error?) ->
//        ()) {
//
//
//        let urlString = "https://cloud.iexapis.com/stable/stock/ge/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with:url) { (data, response, err) in
//
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            //If successful
//            do {
//                let stocks = try JSONDecoder().decode([Stock].self, from: data!)
//                completion(stocks, nil)
//            } catch let jsonError {
//                completion(nil, jsonError)
//            }
//
//            }.resume()
//    }
//
//    fileprivate func fetchBACJSON(completion: @escaping ([Stock]?, Error?) ->
//        ()) {
//
//
//        let urlString = "https://cloud.iexapis.com/stable/stock/bac/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with:url) { (data, response, err) in
//
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            //If successful
//            do {
//                let stocks = try JSONDecoder().decode([Stock].self, from: data!)
//                completion(stocks, nil)
//            } catch let jsonError {
//                completion(nil, jsonError)
//            }
//
//            }.resume()
//    }
//
//    fileprivate func fetchNDAQJSON(completion: @escaping ([Stock]?, Error?) ->
//        ()) {
//
//
//        let urlString = "https://cloud.iexapis.com/stable/stock/ndaq/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with:url) { (data, response, err) in
//
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            //If successful
//            do {
//                let stocks = try JSONDecoder().decode([Stock].self, from: data!)
//                completion(stocks, nil)
//            } catch let jsonError {
//                completion(nil, jsonError)
//            }
//
//            }.resume()
//    }
//
//    fileprivate func fetchAONJSON(completion: @escaping ([Stock]?, Error?) ->
//        ()) {
//
//
//        let urlString = "https://cloud.iexapis.com/stable/stock/aon/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with:url) { (data, response, err) in
//
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            //If successful
//            do {
//                let stocks = try JSONDecoder().decode([Stock].self, from: data!)
//                completion(stocks, nil)
//            } catch let jsonError {
//                completion(nil, jsonError)
//            }
//
//            }.resume()
//    }


}

