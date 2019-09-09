//
//  Line.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/9/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

import UIKit

extension String {
    func size(withSystemFontSize pointSize: CGFloat) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: pointSize)])
    }
}


//Extension taken from https://medium.com/@tstenerson/lets-make-a-line-chart-in-swift-3-5e819e6c1a00
extension CGPoint {
    func adding(x: CGFloat) -> CGPoint { return CGPoint(x: self.x + x, y: self.y) }
    func adding(y: CGFloat) -> CGPoint { return CGPoint(x: self.x, y: self.y + y) }
}

class Line: UIView {
    let lineLayer = CAShapeLayer()
    let dotLayer = CAShapeLayer()
    
    var ChartTransform: CGAffineTransform?
    
    @IBInspectable var lineColor: UIColor = UIColor.black {
        didSet {
            lineLayer.strokeColor = lineColor.cgColor
        }
    }

}
