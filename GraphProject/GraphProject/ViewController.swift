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
    
    let myLine = Line()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //JSON Parsing with help from https://www.youtube.com/watch?v=9iazQQdNoNU by Lets Build That App
        fetchCoursesJSON { (stocks, err) in
            if let err = err {
                print("Failure", err)
                return
            }
            
            stocks?.forEach({ (stock) in
                print(stock.close)
                Points.myPoints.append(stock.close)
            })
            self.myLine.redraw()
        }
        //print(Points.myPoints.count)
    }
    
    
    fileprivate func fetchCoursesJSON(completion: @escaping ([Stock]?, Error?) ->
        ()) {
        
        let urlString = "https://cloud.iexapis.com/stable/stock/aapl/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
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
            
        }.resume()
    }


}

