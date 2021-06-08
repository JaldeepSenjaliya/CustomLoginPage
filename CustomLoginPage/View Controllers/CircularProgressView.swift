//
//  CircularProgressView.swift
//  CustomLoginPage
//
//  Created by Jaldeep Patel on 2021-06-08.
//

import UIKit

class CircularProgressView: UIView {

    var progressLyr = CAShapeLayer()
    var trackLyr = CAShapeLayer()
    
    // Add required init function, when we design the UI from storyboard we should be using required init, when you design the UI programmatically we will use override init, in our case we’re going to use require init.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeCircularPath()
    }
    
    //Setting the property progressLyr and trackLyr.
    //didSet is a property observer, Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value
    
    var progressClr = UIColor.white {
        didSet {
            progressLyr.strokeColor = progressClr.cgColor
        }
    }
    
    var trackClr = UIColor.white {
        didSet {
            trackLyr.strokeColor = trackClr.cgColor
        }
    }
    
    //Creating a circular path, defining the parameters of it and it’s behaviour.
    func makeCircularPath() {
        
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        
        //Starting point: (-pi / 2) = -0.5 * pi
        //Ending point: (3 * pi / 2) = 1.5 * pi
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        
        //Properties of tracking path
        trackLyr.path = circlePath.cgPath
        trackLyr.fillColor = UIColor.clear.cgColor
        trackLyr.strokeColor = trackClr.cgColor
        trackLyr.lineWidth = 30.0
        trackLyr.strokeEnd = 1.0
        layer.addSublayer(trackLyr)
        
        //Properties of progress path
        progressLyr.path = circlePath.cgPath
        progressLyr.fillColor = UIColor.clear.cgColor
        progressLyr.strokeColor = progressClr.cgColor
        progressLyr.lineCap = .round
        progressLyr.lineWidth = 30.0
        progressLyr.strokeEnd = 0.0
        layer.addSublayer(progressLyr)
    }
    
    //Progressbar animation
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        progressLyr.strokeEnd = CGFloat(value)
        progressLyr.add(animation, forKey: "animateprogress")
    }
}
