//
//  ViewController.swift
//  Paint_38
//
//  Created by George Digmelashvili on 6/10/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var path = UIBezierPath()
    var drawLayer = CAShapeLayer()
    var touch = [CGPoint]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.layer.addSublayer(drawLayer)
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        path.removeAllPoints()
        drawLayer.path = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch.removeAll()
        touch.append(touches.first!.location(in: nil))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let fTouch = touches.first!.location(in: nil)
        touch.append(touches.first!.location(in: nil))
        path.move(to: fTouch)
        path.addLine(to: touch.first!)
        touch.removeFirst()
        path.close()
        
        drawLayer.lineWidth = 10
        drawLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        drawLayer.lineJoin = .round
        drawLayer.path = path.cgPath
        
    }
}

