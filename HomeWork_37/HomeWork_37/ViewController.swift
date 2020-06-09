//
//  ViewController.swift
//  HomeWork_37
//
//  Created by George Digmelashvili on 6/9/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCircles()
    }
    
    
    
    func setCircles() {
        let height = circleView.frame.height * 3 / 4
        let width  = circleView.frame.width * 3 / 4
        
        let firstLayer = CALayer()
        firstLayer.backgroundColor      = UIColor.green.cgColor
        firstLayer.position             = CGPoint(x: (circleView.frame.width - width) / 2, y: (circleView.frame.height - height) / 2)
        firstLayer.frame.size           = CGSize(width: width, height: height)
        firstLayer.cornerRadius         = firstLayer.frame.size.height / 2
        
        let height2 = height / 1.3
        let width2  = width / 1.3
        
        let secondLayer = CALayer()
        secondLayer.backgroundColor   = UIColor.white.cgColor
        secondLayer.position          = CGPoint(x: (width - width2) / 2, y: (height - height2) / 2)
        secondLayer.frame.size        = CGSize(width: width2 , height: height2)
        secondLayer.borderWidth       = 5
        secondLayer.borderColor       = UIColor.blue.cgColor
        secondLayer.cornerRadius      = secondLayer.frame.size.height / 2
        
        firstLayer.addSublayer(secondLayer)
        circleView.layer.addSublayer(firstLayer)
        
    }
}

