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
    
    var urlsChosen = false
    
    //@IBOutlet var myButton : UIButton!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        urlList[0] = "https://cloud.iexapis.com/stable/stock/" + urlText1.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[1] = "https://cloud.iexapis.com/stable/stock/" + urlText2.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[2] = "https://cloud.iexapis.com/stable/stock/" + urlText3.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[3] = "https://cloud.iexapis.com/stable/stock/" + urlText4.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[4] = "https://cloud.iexapis.com/stable/stock/" + urlText5.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[5] = "https://cloud.iexapis.com/stable/stock/" + urlText6.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[6] = "https://cloud.iexapis.com/stable/stock/" + urlText7.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[7] = "https://cloud.iexapis.com/stable/stock/" + urlText8.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        urlList[8] = "https://cloud.iexapis.com/stable/stock/" + urlText9.text! + "/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07"
        
        Companies.myCompNames[0] = urlText1.text!
        Companies.myCompNames[1] = urlText2.text!
        Companies.myCompNames[2] = urlText3.text!
        Companies.myCompNames[3] = urlText4.text!
        Companies.myCompNames[4] = urlText5.text!
        Companies.myCompNames[5] = urlText6.text!
        Companies.myCompNames[6] = urlText7.text!
        Companies.myCompNames[7] = urlText8.text!
        Companies.myCompNames[8] = urlText9.text!
        
        urlText1.removeFromSuperview()
        urlText2.removeFromSuperview()
        urlText3.removeFromSuperview()
        urlText4.removeFromSuperview()
        urlText5.removeFromSuperview()
        urlText6.removeFromSuperview()
        urlText7.removeFromSuperview()
        urlText8.removeFromSuperview()
        urlText9.removeFromSuperview()
        myButton.removeFromSuperview()
        InsertText.removeFromSuperview()
        stockSubtext.removeFromSuperview()
        
        self.readyToGraph()
    }
//    
    @IBOutlet var urlText1 : UITextField!
    @IBOutlet var urlText2 : UITextField!
    @IBOutlet var urlText3 : UITextField!
    @IBOutlet var urlText4 : UITextField!
    @IBOutlet var urlText5 : UITextField!
    @IBOutlet var urlText6 : UITextField!
    @IBOutlet var urlText7 : UITextField!
    @IBOutlet var urlText8 : UITextField!
    @IBOutlet var urlText9 : UITextField!
    
    
    @IBOutlet var stockSubtext: UILabel!
    
    lazy var urlTexts = [urlText1, urlText2, urlText3, urlText4, urlText5, urlText6, urlText7, urlText8, urlText9]
    
    @IBOutlet var InsertText: UILabel!
    
    @IBOutlet var myButton : UIButton!
    
    
    @IBOutlet var stockText: UILabel!
    //
    var urlList = ["https://cloud.iexapis.com/stable/stock/nflx/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/aapl/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/msft/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/csco/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/c/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/ndaq/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/amd/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/uber/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07", "https://cloud.iexapis.com/stable/stock/fb/chart?token=pk_90a7bafca78c4a1ab5f65b153defdf07",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        myButton.backgroundColor = UIColor(red: 1, green: 0.478, blue: 0.478, alpha: 1)
        myButton.layer.cornerRadius = myButton.frame.height/2
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.layer.shadowColor = UIColor.darkGray.cgColor
        myButton.layer.shadowRadius = 4
        myButton.layer.shadowOpacity = 0.5
        myButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        stockText.isHidden = true
        
        for n in 0...urlTexts.count - 1 {
            urlTexts[n]!.backgroundColor = UIColor(red: 0.160, green: 0.501, blue: 0.725, alpha: 1)
            urlTexts[n]!.layer.cornerRadius = myButton.frame.height/2
            urlTexts[n]!.layer.borderColor = UIColor.black.cgColor
            urlTexts[n]!.textColor = UIColor.white
            urlTexts[n]!.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func readyToGraph() {
        let loadingLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.width) / 2 - 30, y: Int(UIScreen.main.bounds.height) / 2, width: 120, height: 30))
        self.view.addSubview(loadingLabel)
        loadingLabel.text = "Loading..."
        loadingLabel.textColor = UIColor.black
        loadingLabel.font = UIFont(name: "Helvetica", size: 19.0)
        loadingLabel.textAlignment = NSTextAlignment.left
        loadingLabel.layer.borderColor = UIColor.clear.cgColor
        //JSON Parsing with help from https://www.youtube.com/watch?v=9iazQQdNoNU by Lets Build That App
        while(counterForJSON < urlList.count) {
            fetchAAPLJSON { (stocks, err) in
                if let err = err {
                    print("Failure", err)
                    return
                }
                
                stocks?.forEach({ (stock) in
                    Points.myPoints[self.counterForJSON2].append(stock.close)
                })
            }
            counterForJSON+=1
        }
        
        while(Points.myPoints[0].count < 6 || Points.myPoints[1].count < 6 || Points.myPoints[2].count < 6 || Points.myPoints[3].count < 6 || Points.myPoints[4].count < 6 || Points.myPoints[5].count < 6 || Points.myPoints[6].count < 6 || Points.myPoints[7].count < 6 || Points.myPoints[8].count < 6) {
            
        }
        
        Points.myPoints.sort { $1[0] < $0[0] }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let myLine = Line(frame: CGRect(x: UIScreen.main.bounds.width/4 - 75, y: UIScreen.main.bounds.height/4 - 150, width: UIScreen.main.bounds.width/2 + 150, height: UIScreen.main.bounds.height/2 + 210))
            self.view.addSubview(myLine)
            let myLegend = Legend(frame: CGRect(x: UIScreen.main.bounds.width/20, y: UIScreen.main.bounds.height/4 - 20, width: UIScreen.main.bounds.width/5.75, height: UIScreen.main.bounds.height/1.5))
            self.view.addSubview(myLegend)
            loadingLabel.removeFromSuperview()
            self.stockText.isHidden = false
        }
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

