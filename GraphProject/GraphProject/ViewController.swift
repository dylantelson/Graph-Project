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
    
    let urlList = ["https://cloud.iexapis.com/stable/stock/aapl/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/msft/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/ge/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/bac/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/ndaq/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db", "https://cloud.iexapis.com/stable/stock/aon/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //JSON Parsing with help from https://www.youtube.com/watch?v=9iazQQdNoNU by Lets Build That App
        fetchAAPLJSON { (stocks, err) in
            if let err = err {
                print("Failure", err)
                return
            }
                
            stocks?.forEach({ (stock) in
                print(stock.close)
                Points.myPoints[0].append(stock.close)
            })
        }
        fetchMSFTJSON { (stocks, err) in
            if let err = err {
                print("Failure", err)
                return
            }
            
            stocks?.forEach({ (stock) in
                print(stock.close)
                Points.myPoints[1].append(stock.close)
            })
        }
        fetchGEJSON { (stocks, err) in
            if let err = err {
                print("Failure", err)
                return
            }
            
            stocks?.forEach({ (stock) in
                print(stock.close)
                Points.myPoints[2].append(stock.close)
            })
        }
        fetchBACJSON { (stocks, err) in
            if let err = err {
                print("Failure", err)
                return
            }
            
            stocks?.forEach({ (stock) in
                print(stock.close)
                Points.myPoints[3].append(stock.close)
            })
        }
        fetchNDAQJSON { (stocks, err) in
            if let err = err {
                print("Failure", err)
                return
            }
            
            stocks?.forEach({ (stock) in
                print(stock.close)
                Points.myPoints[4].append(stock.close)
            })
        }
        fetchAONJSON { (stocks, err) in
            if let err = err {
                print("Failure", err)
                return
            }
            
            stocks?.forEach({ (stock) in
                print(stock.close)
                Points.myPoints[5].append(stock.close)
            })
        }
        
        DispatchQueue.main.async {
            let myLine = Line(frame: CGRect(x: UIScreen.main.bounds.width/4, y: UIScreen.main.bounds.height/4, width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2))
            self.view.addSubview(myLine)
        }
    }
    
    
    fileprivate func fetchAAPLJSON(completion: @escaping ([Stock]?, Error?) ->
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
    
    fileprivate func fetchMSFTJSON(completion: @escaping ([Stock]?, Error?) ->
        ()) {
        
        
        let urlString = "https://cloud.iexapis.com/stable/stock/msft/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
        
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
    
    fileprivate func fetchGEJSON(completion: @escaping ([Stock]?, Error?) ->
        ()) {
        
        
        let urlString = "https://cloud.iexapis.com/stable/stock/ge/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
        
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
    
    fileprivate func fetchBACJSON(completion: @escaping ([Stock]?, Error?) ->
        ()) {
        
        
        let urlString = "https://cloud.iexapis.com/stable/stock/bac/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
        
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
    
    fileprivate func fetchNDAQJSON(completion: @escaping ([Stock]?, Error?) ->
        ()) {
        
        
        let urlString = "https://cloud.iexapis.com/stable/stock/ndaq/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
        
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
    
    fileprivate func fetchAONJSON(completion: @escaping ([Stock]?, Error?) ->
        ()) {
        
        
        let urlString = "https://cloud.iexapis.com/stable/stock/aon/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db"
        
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

