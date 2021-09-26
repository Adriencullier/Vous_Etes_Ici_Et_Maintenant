//
//  CircularProgressView.swift
//  CircularProgressView
//
//  Created by Adrien Cullier on 21/09/2021.
//

import Foundation
import UIKit

class CircularProgressView : UIView {
    
    private var circleLayer = CAShapeLayer()
    public var progressLayer = CAShapeLayer()
    public var progressSubGoalLayer = CAShapeLayer()
    public var subGoalLayer = CAShapeLayer()
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func animatingCircularPath (startPointCurrentTime : Double) {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: frame.size.width/2, startAngle: -.pi/2, endAngle: 3 * .pi/2, clockwise: true)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.black.cgColor
        progressLayer.lineWidth = 5
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = startPointCurrentTime
        
        layer.addSublayer(progressLayer)

        
    }
    
    public func createCircularPath() {
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: frame.size.width/2, startAngle: -.pi/2, endAngle: 3 * .pi/2, clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor(cgColor: CGColor(gray: 0.8, alpha: 0.6)).cgColor
        
        circleLayer.lineWidth = 5

        layer.addSublayer(circleLayer)
    }
    
    public func createSubGoalCircularPath(endPoint : Double) {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: frame.size.width/2, startAngle: -.pi/2, endAngle: 3 * .pi/2, clockwise: true)
        
        subGoalLayer.path = circularPath.cgPath
        subGoalLayer.fillColor = UIColor.clear.cgColor
        subGoalLayer.strokeColor = UIColor.lightGray.cgColor
        subGoalLayer.lineWidth = 5
        subGoalLayer.lineCap = .round
        subGoalLayer.strokeEnd = endPoint
        
        layer.addSublayer(subGoalLayer)
    }

    
    
}
