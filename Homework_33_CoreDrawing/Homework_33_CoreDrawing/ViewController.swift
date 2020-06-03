//
//  ViewController.swift
//  Homework_33_CoreDrawing
//
//  Created by George Digmelashvili on 6/3/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class Canvas: UIView{
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        let square = CGRect(x: 0, y: 0, width: 240, height: 128)
        context.setFillColor(UIColor.yellow.cgColor)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setLineWidth(15)
        context.addRect(square)
        context.drawPath(using: .fillStroke)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var myView: UIView!
    @IBOutlet var myView2: UIView!
    let canvas = Canvas()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        canvas.frame = self.myView.bounds
        myView.addSubview(canvas)
        draw()
    }
    
    
    func draw(){
        let render = UIGraphicsImageRenderer(size: CGSize(width: myView.frame.width, height: myView.frame.height))
        let img = render.image {(ctx) in
            let square = CGRect(x: 0, y: 0, width: myView.frame.width, height: myView.frame.height)
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.green.cgColor)
            ctx.cgContext.setLineWidth(15)
            ctx.cgContext.addRect(square)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        self.myView2.backgroundColor = UIColor(patternImage: img)
    }
    
}


