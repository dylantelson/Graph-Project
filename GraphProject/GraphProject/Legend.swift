//
//  Legend.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/20/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

import UIKit

class Legend: UIView {
    
    var circles = [UIBezierPath()]
    var labels = [UILabel()]
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
        //self.backgroundColor = UIColor(red: 0.858, green: 0.203, blue: 0.270, alpha: 1)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    override func draw(_ rect: CGRect) {
        
        for _ in 0...Points.myPoints.count - 1 {
            circles.append(UIBezierPath())
            labels.append(UILabel())
        }
        
        for n in 0...7 {
            labels[n] = UILabel(frame: CGRect(x: 55, y: Int(self.bounds.height) / 8 * n + 3, width: 100, height: 15))
            self.addSubview(labels[n])
            print(Companies.myCompNames[Companies.myComps[n]])
            labels[n].text = Companies.myCompNames[Companies.myComps[n]]
            labels[n].textColor = UIColor.black
            labels[n].font = UIFont .systemFont(ofSize: 9.0, weight: UIFont.Weight(rawValue: 0.4))
            labels[n].textAlignment = NSTextAlignment.left
            labels[n].layer.borderColor = UIColor.clear.cgColor
            circles[n].lineWidth = 0.3
            Colors.myColors[n].setFill()
            UIColor.black.setStroke()
            circles[n] = UIBezierPath(ovalIn: CGRect(x: 40,
                                                    y: 5 + Int(self.bounds.height) / 8 * n,
                                                    width: 10,
                                                    height: 10))
            circles[n].fill()
            circles[n].stroke()
        }
    }

}
