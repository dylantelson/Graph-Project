//
//  Line.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/9/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

import UIKit
import Foundation

class Line: UIView {
    
    // used Roberto Viana's youtube video https://www.youtube.com/watch?v=9sJxtzTo8W0 to learn how to use UIBezierPath and basic methods for drawing lines
    
    var myPoints = [[CGFloat]]()
   
    var myLine = UIBezierPath()
    
    func getJsonFromUrl(){
        //creating a NSURL
        let url = NSURL(string: "https://cloud.iexapis.com/stable/stock/aapl/chart?token=sk_5b18d8815df14e43a9e8ba4f8ab693db")
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            
        }).resume()
    }
    
    //TODO LIST:
    //Probably change it so only Y is taken, rather than X and Y, as X will end up just being every day for stock market and thus will can just be bounds.width/myPoints.count
    //Make JSON work, taking it from a URL, and use IEXCloud's API (https://iexcloud.io/console/tokens) to get data for each stock (Example for Apple stock of last month: https://cloud.iexapis.com/stable/stock/aapl/quote?token=sk_5b18d8815df14e43a9e8ba4f8ab693db
    //Add 7 or so companies, such as Apple Microsoft etc. and make each a different color
    //Add background which shows legend, x and y grid, etc

    func graph() {
        myPoints.append([])
        myPoints.append([])
        myPoints[0].append(bounds.width/2)
        myPoints[0].append(bounds.height/2)
        myPoints[1].append(bounds.width)
        myPoints[1].append(bounds.height)
        myLine.move(to: .init(x:0, y: bounds.height/2))
        for point in myPoints {
            myLine.addLine(to: .init(x: point[0], y: point[1]))
        }
        
        UIColor.red.setStroke()
        myLine.lineWidth = 2
        myLine.stroke()
    }

    override func draw(_ rect: CGRect) {
        graph()
    }
}
