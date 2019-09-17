//
//  Line.swift
//  GraphProject
//
//  Created by Dylan Telson on 9/9/19.
//  Copyright © 2019 Dylan Telson. All rights reserved.
//

struct Points {
    static var myPoints = [[Float](), [Float](), [Float](), [Float](), [Float](), [Float]()]
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
        setupView()
    }
    
    // #3
    public convenience init(image: UIImage, title: String) {
        self.init(frame: .zero)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        // Create, add and layout the children views ..
    }
    
   // var myPoints = [[CGFloat]]()
    
    // used Roberto Viana's youtube video https://www.youtube.com/watch?v=9sJxtzTo8W0 to learn how to use UIBezierPath and basic methods for drawing lines
   
    var myLine = UIBezierPath()
    
    //TODO LIST:
    //Probably change it so only Y is taken, rather than X and Y, as X will end up just being every day for stock market and thus will can just be bounds.width/myPoints.count
    //Make JSON work, taking it from a URL, and use IEXCloud's API (https://iexcloud.io/console/tokens) to get data for each stock (Example for Apple stock of last month: https://cloud.iexapis.com/stable/stock/aapl/quote?token=sk_5b18d8815df14e43a9e8ba4f8ab693db
    //Add 7 or so companies, such as Apple Microsoft etc. and make each a different color
    //Add background which shows legend, x and y grid, etc
    
    
    //This doesn't seem to be working. When I asked on a swift help IRC how to create a subview programmatically, they said this:
    //Get an IBOutlet to a stack view that is where you want your thingie to be, create your view by calling init ( Line(), Line(frame: .zero) or whatever init you added), set all the properties you want, and then call stackView.addArrangedSubview(yourGraph), all on main thread
    //Oh, and you might or might not have to set .translatesAutoresizingMaskToConstraints to false if you're making Line from code
    func redraw() {
        DispatchQueue.main.async {
            print(self.bounds)
            self.frame = CGRect(x: 100 , y: 100, width: 100, height: 100)
            print(self.bounds)
            self.setNeedsDisplay()
        }
    }

    func graph() {
        //self.frame = CGRect(x: 100 , y: 100, width: 100, height: 100)
        
        for n in 0...Points.myPoints.count-1 {
            myLine.move(to: .init(x:0, y: Int(Points.myPoints[n][0]) - 150))
            for m in 1...Points.myPoints[n].count - 1 {
                myLine.addLine(to: .init(x: n * 30, y: Int(Points.myPoints[n][m]) - 150))
            }
        }
        UIColor.red.setStroke()
        myLine.lineWidth = 2
        myLine.stroke()
    }

    override func draw(_ rect: CGRect) {
        print("wow")
        self.graph()
    }
}
