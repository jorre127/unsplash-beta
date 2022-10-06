//
//  CircularProgressView.swift
//  unsplash_beta
//
//  Created by Jordy De Jonghe on 06/10/2022.
//

import UIKit

@IBDesignable
class CircularProgressView: UIView {
    
private var circleLayer = CAShapeLayer()
private var progressLayer = CAShapeLayer()
    
var radius: Double = 20
var lineWidth: Double = 5
var score: Double = 0
var progressForegroundColor: UIColor = .green
var progressBackgroundColor: UIColor = .gray
    
override init(frame: CGRect) {
super.init(frame: frame)
createCircularPath()
}
    
required init?(coder aDecoder: NSCoder) {
super.init(coder: aDecoder)
createCircularPath()
}
    
func createCircularPath() {
let circularPath = UIBezierPath(
    arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
    radius: radius,
    startAngle: -.pi / 2,
    endAngle: 3 * .pi / 2,
    clockwise: true
)
    circleLayer.path = circularPath.cgPath
    circleLayer.fillColor = UIColor.clear.cgColor
    circleLayer.lineCap = .round
    circleLayer.lineWidth = lineWidth
    circleLayer.strokeColor = progressBackgroundColor.cgColor
    
    progressLayer.path = circularPath.cgPath
    progressLayer.fillColor = UIColor.clear.cgColor
    progressLayer.lineCap = .round
    progressLayer.lineWidth = lineWidth
    progressLayer.strokeEnd = 0
    progressLayer.strokeColor = progressForegroundColor.cgColor
    
    layer.addSublayer(circleLayer)
    layer.addSublayer(progressLayer)
}
    
    func progressAnimation(duration: TimeInterval, value: Double) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value / 10
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "circularProgressAnimation")
    }
}
