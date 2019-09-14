//
//  Line.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/9/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

struct Points {
    static var myPoints = [Float]()
}

import UIKit
import Foundation

class Line: UIView {
    
   // var myPoints = [[CGFloat]]()
    
    // used Roberto Viana's youtube video https://www.youtube.com/watch?v=9sJxtzTo8W0 to learn how to use UIBezierPath and basic methods for drawing lines
   
    var myLine = UIBezierPath()
    
    //TODO LIST:
    //Probably change it so only Y is taken, rather than X and Y, as X will end up just being every day for stock market and thus will can just be bounds.width/myPoints.count
    //Make JSON work, taking it from a URL, and use IEXCloud's API (https://iexcloud.io/console/tokens) to get data for each stock (Example for Apple stock of last month: https://cloud.iexapis.com/stable/stock/aapl/quote?token=sk_5b18d8815df14e43a9e8ba4f8ab693db
    //Add 7 or so companies, such as Apple Microsoft etc. and make each a different color
    //Add background which shows legend, x and y grid, etc
    
    func redraw() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setNeedsDisplay()
        }
    }

    func graph() {
        
        Points.myPoints.append(50)
        Points.myPoints.append(150)
        Points.myPoints.append(20)
        Points.myPoints.append(50)
        myLine.move(to: .init(x:0, y: Int(Points.myPoints[0])))
        for n in 1...Points.myPoints.count-1 {
            myLine.addLine(to: .init(x: n * 30, y: Int(Points.myPoints[n])))
        }

        UIColor.red.setStroke()
        myLine.lineWidth = 2
        myLine.stroke()
    }

    var test = 0
    override func draw(_ rect: CGRect) {
        if(test == 0){
            test = test + 1
            return
        }
        print("wow")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.graph()
            //        }
        //self.graph()
    }
}
}
