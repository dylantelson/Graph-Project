//
//  Line.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/9/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

struct Points {
    static var myPoints = [[Float](), [Float](), [Float](), [Float](), [Float](), [Float](), [Float](), [Float]()]
}

struct Companies {
    static var myCompNames = ["aapl", "fb", "msft", "ndaq", "c", "csco", "uber", "amd"]
}

struct Colors {
    static var myColors = [/*green*/ UIColor(red: 0.180, green: 0.8, blue: 0.443, alpha: 1), /*blue*/ UIColor(red: 0.160, green: 0.501, blue: 0.725, alpha: 1), /*red*/  UIColor(red: 1, green: 0.478, blue: 0.478, alpha: 1), /*pink*/ UIColor(red: 0.941, green: 0.501, blue: 0.721, alpha: 1), /*orange*/  UIColor(red: 0.952, green: 0.611, blue: 0.070, alpha: 1), /*purple*/  UIColor(red: 0.607, green: 0.349, blue: 0.713, alpha: 1), /*darkred*/  UIColor(red: 0.843, green: 0.2, blue: 0.156, alpha: 1), /*seafoam*/  UIColor(red: 0.2, green: 0.8, blue: 0.8, alpha: 1)]
}

import UIKit
import Foundation

class Line: UIView {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // #2
    public override init(frame: CGRect) {
        super.init(frame: frame)
        //setupView()
        self.isOpaque = false
        //self.backgroundColor = UIColor(red: 0.858, green: 0.203, blue: 0.270, alpha: 1)
        //self.backgroundColor = UIColor.white
    }
    
    // used Roberto Viana's youtube video https://www.youtube.com/watch?v=9sJxtzTo8W0 to learn how to use UIBezierPath and basic methods for drawing lines
   
    let myLine = UIBezierPath()
    let myLine2 = UIBezierPath()
    let myLine3 = UIBezierPath()
    let myLine4 = UIBezierPath()
    let myLine5 = UIBezierPath()
    let myLine6 = UIBezierPath()
    let myLine7 = UIBezierPath()
    let myLine8 = UIBezierPath()
    
    lazy var myLines = [myLine, myLine2, myLine3, myLine4, myLine5, myLine6, myLine7, myLine8]
    
    let myGraphLine = UIBezierPath()
    let myGraphLineThin = UIBezierPath()
    
    var circles = [[UIBezierPath()], [UIBezierPath()], [UIBezierPath()], [UIBezierPath()], [UIBezierPath()], [UIBezierPath()], [UIBezierPath()], [UIBezierPath()]]
    
    //TODO LIST:
    //Add labels for X and Y, possibly make it so when you click on a circle it shows you the Y value? (New view which would display the Y value, meaning abs(Int(Points.myPoints[n][m]) - 200)). Would have to store that information somewhere.

    func graph() {
        
        for n in 0...7 {
            //UIColor(red: 0.886, green: 0.909, blue: 0.913, alpha: 1).setStroke()
            UIColor(red: 0.635, green: 0.737, blue: 0.764, alpha: 1).setStroke()
            myGraphLineThin.move(to: .init(x:0, y: n * Int(self.bounds.height) / 8 - 1))
            myGraphLineThin.addLine(to: .init(x: Int(self.bounds.width), y: n * Int(self.bounds.height) / 8 - 1))
            
            for m in 0...Points.myPoints[0].count - 1 {
                circles[n].append(UIBezierPath())
            }
        }
        myGraphLine.stroke()
        
//        myGraphLineThin.move(to: .init(x:0, y: 0))
//        myGraphLineThin.addLine(to: .init(x: Int(self.bounds.width), y: 0))
//        
//        
//        myGraphLineThin.move(to: .init(x:Int(self.bounds.width), y: 0))
//        myGraphLineThin.addLine(to: .init(x: Int(self.bounds.width), y: Int(self.bounds.height)))
        myGraphLineThin.lineWidth = 1
        myGraphLineThin.stroke()
        
        for n in 0...Points.myPoints.count-1 {
            Colors.myColors[n].setStroke()
            Colors.myColors[n].setFill()
            myLines[n].lineWidth = 2
            myLines[n].move(to: .init(x:0, y: abs(Int(Points.myPoints[n][0]) - 200)))
            for m in 1...Points.myPoints[n].count - 1 {
                circles[n][m].lineWidth = 1
                myLines[n].addLine(to: .init(x: m * 30, y: abs(Int(Points.myPoints[n][m]) - 200)))
                circles[n][m] = UIBezierPath(ovalIn: CGRect(x: (m * 30) - 2,
                                                         y: (abs(Int(Points.myPoints[n][m]) - 200)) - 2,
                                                         width: 4,
                                                         height: 4))
                circles[n][m].fill()
                circles[n][m].stroke()
            }
            myLines[n].stroke()
        }
        UIColor(red: 0.635, green: 0.737, blue: 0.764, alpha: 1).setStroke()
        myGraphLine.move(to: .init(x:1, y: 0))
        myGraphLine.addLine(to: .init(x: 1, y: Int(self.bounds.height)))
        
        
        myGraphLine.move(to: .init(x:0, y: Int(self.bounds.height) - 1))
        myGraphLine.addLine(to: .init(x: Int(self.bounds.width), y: Int(self.bounds.height) - 1))
        myGraphLine.lineWidth = 1
        myGraphLine.stroke()
    }

    override func draw(_ rect: CGRect) {
        self.graph()
    }
}
