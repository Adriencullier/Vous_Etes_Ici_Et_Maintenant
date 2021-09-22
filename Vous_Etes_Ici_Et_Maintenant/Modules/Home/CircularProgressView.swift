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
        progressLayer.strokeColor = UIColor.blue.cgColor
        progressLayer.lineWidth = 10
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = startPointCurrentTime
        
        layer.addSublayer(progressLayer)

        
    }
    
    public func createCircularPath(endPointSubGoal : Double) {
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: frame.size.width/2, startAngle: -.pi/2, endAngle: 3 * .pi/2, clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.gray.cgColor
        circleLayer.lineWidth = 10

        
        
        
        progressSubGoalLayer.path = circularPath.cgPath
        progressSubGoalLayer.fillColor = UIColor.clear.cgColor
        progressSubGoalLayer.strokeColor = UIColor.yellow.cgColor
        progressSubGoalLayer.lineWidth = 10
        progressSubGoalLayer.lineCap = .round
        progressSubGoalLayer.strokeEnd = endPointSubGoal
        
        
        layer.addSublayer(circleLayer)
        layer.addSublayer(progressSubGoalLayer)
    }

    
    
}
