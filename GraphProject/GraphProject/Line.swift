//
//  Line.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/9/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

import UIKit

class Line: UIView {
    
    // used Roberto Viana's youtube video https://www.youtube.com/watch?v=9sJxtzTo8W0 to learn how to use UIBezierPath and basic methods for drawing lines
    
    var myPoints = [[CGFloat]]()
   
    var myLine = UIBezierPath()
    
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
