//
//  Legend.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/20/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

import UIKit

struct currCompSelected {
    static var curr = 0
}

class Legend: UIView {
    
    var circles = [UIBezierPath()]
    var labels = [UILabel()]
    
    let myVC = ViewController()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    override func draw(_ rect: CGRect) {
        
        for _ in 0...Points.myPoints.count - 1 {
            circles.append(UIBezierPath())
            labels.append(UILabel())
        }
        
        for n in 0...Points.myPoints.count - 1 {
            labels[n] = UILabel(frame: CGRect(x: 55, y: Int(self.bounds.height) / Points.myPoints.count * n + 2, width: 100, height: 15))
            self.addSubview(labels[n])
            labels[n].isUserInteractionEnabled = true
            labels[n].text = Companies.myCompNames[n]
            labels[n].textColor = UIColor.black
            labels[n].font = UIFont(name: "Helvetica", size: 9.0)
            labels[n].textAlignment = NSTextAlignment.left
            labels[n].layer.borderColor = UIColor.clear.cgColor
            circles[n].lineWidth = 0.1
            Colors.myColors[n].setFill()
            UIColor.clear.setStroke()
            circles[n] = UIBezierPath(ovalIn: CGRect(x: 40,
                                                    y: 5 + Int(self.bounds.height) / 9 * n,
                                                    width: 10,
                                                    height: 10))
            circles[n].fill()
            circles[n].stroke()
        }
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(handleTap3))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(handleTap4))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(handleTap5))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(handleTap6))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(handleTap7))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(handleTap8))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(handleTap9))
        
        labels[0].addGestureRecognizer(gestureRecognizer1)
        labels[1].addGestureRecognizer(gestureRecognizer2)
        labels[2].addGestureRecognizer(gestureRecognizer3)
        labels[3].addGestureRecognizer(gestureRecognizer4)
        labels[4].addGestureRecognizer(gestureRecognizer5)
        labels[5].addGestureRecognizer(gestureRecognizer6)
        labels[6].addGestureRecognizer(gestureRecognizer7)
        labels[7].addGestureRecognizer(gestureRecognizer8)
        labels[8].addGestureRecognizer(gestureRecognizer9)
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 0
    }
    @objc func handleTap2(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 1    }
    @objc func handleTap3(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 2    }
    @objc func handleTap4(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 3    }
    @objc func handleTap5(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 4    }
    @objc func handleTap6(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 5    }
    @objc func handleTap7(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 6
    }
    @objc func handleTap8(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 7
    }
    @objc func handleTap9(gestureRecognizer: UIGestureRecognizer) {
        currCompSelected.curr = 8
    }

}
