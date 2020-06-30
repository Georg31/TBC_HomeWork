//
//  ViewController.swift
//  Homework-51-RoundProgressBar
//
//  Created by George Digmelashvili on 6/30/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var degreeLabel = UILabel()
    var progressView: UIView!{
        let v = UIView()
        v.frame.size = CGSize(width: 200, height: 200)
        v.isMultipleTouchEnabled = true
        v.isUserInteractionEnabled = true
        v.center = view.center
        v.layer.cornerRadius = 100
        v.backgroundColor = .clear
        let dragBall = UIPanGestureRecognizer(target: self, action:#selector(move))
        v.addGestureRecognizer(dragBall)
        return v
    }
    var midViewX = CGFloat()
    var midViewY = CGFloat()
    
    var circlePath2 = UIBezierPath()
    var shapeLayer2 = CAShapeLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    func setUpView(){
        degreeLabel.frame.size = CGSize(width: 80, height: 20)
        degreeLabel.textAlignment = .center
        degreeLabel.center = progressView.center
        degreeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        degreeLabel.font = UIFont.systemFont(ofSize: 25)
        degreeLabel.text = "90º"
        midViewX = progressView.frame.midX
        midViewY = progressView.frame.midY
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: midViewX,y: midViewY), radius: CGFloat(100), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = .none
        shapeLayer.strokeColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        shapeLayer.lineWidth = 20.0
        view.layer.addSublayer(shapeLayer)
        let angleEarth: Double = 0
        let angleEarthAfterCalculate: CGFloat = CGFloat(angleEarth*Double.pi/180) - CGFloat(Double.pi/2)
        let earthX = midViewX + cos(angleEarthAfterCalculate)*100
        let earthY = midViewY + sin(angleEarthAfterCalculate)*100
        circlePath2 = UIBezierPath(arcCenter: CGPoint(x: earthX,y: earthY), radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer2.path = circlePath2.cgPath
        shapeLayer2.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        shapeLayer2.strokeColor = .none
        shapeLayer2.lineWidth = 7
        view.layer.addSublayer(shapeLayer2)
        
        view.addSubview(degreeLabel)
        self.view.addSubview(progressView)
    }
    
    
    @objc func move(recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: nil);
        let earthX = Double(point.x)
        let earthY = Double(point.y)
        let midViewXDouble = Double(midViewX)
        let midViewYDouble = Double(midViewY)
        let angleX = (earthX - midViewXDouble)
        let angleY = (earthY - midViewYDouble)
        let angle = atan2(angleY, angleX)
        let earthX2 = midViewXDouble + cos(angle)*100
        let earthY2 = midViewYDouble + sin(angle)*100
        circlePath2 = UIBezierPath(arcCenter: CGPoint(x: earthX2,y: earthY2), radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer2.path = circlePath2.cgPath
        
        let s = Int(point.angle(to: self.progressView.center).rounded())
        degreeLabel.text = "\(s)º"
        
        
    }
}

extension CGPoint {
    func angle(to comparisonPoint: CGPoint) -> CGFloat {
        let originX = comparisonPoint.x - self.x
        let originY = comparisonPoint.y - self.y
        let bearingRadians = atan2(Float(originY), Float(originX))
        var bearingDegrees = CGFloat(bearingRadians).degrees
        while bearingDegrees < 0 {
            bearingDegrees += 360
        }
        return bearingDegrees
    }
}

extension CGFloat {
    var degrees: CGFloat {
        return self * CGFloat(180.0 / Double.pi)
    }
}
