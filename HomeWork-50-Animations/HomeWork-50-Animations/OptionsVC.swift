//
//  OptionsVC.swift
//  HomeWork-50-Animations
//
//  Created by George Digmelashvili on 6/29/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol animate {
    func scale()
    func rotate()
}

class OptionsVC: UIViewController {
    
    @IBOutlet var dampingLabel: UILabel!
    @IBOutlet var velocityLabel: UILabel!
    @IBOutlet var rotateLabel: UILabel!
    @IBOutlet var xLabel: UILabel!
    @IBOutlet var yLabel: UILabel!
    @IBOutlet var scaleLabel: UILabel!
    
    @IBOutlet var cancelView: UIView!
    var del: animate?
    var variables: Variables?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    @IBAction func dampingChanger(_ sender: UISlider) {
        variables!.damping = Double(sender.value)
        let str = String(format: "%.1f", variables!.damping)
        dampingLabel.text = "Damping: \(str)"
    }
    
    @IBAction func scaleChanger(_ sender: UISlider) {
        variables!.scale = Double(sender.value)
        let str = String(format: "%.1f", variables!.scale)
        scaleLabel.text = "Scale: \(str)"
        del?.scale()
    }
    
    @IBAction func rotateChanger(_ sender: UISlider) {
        variables!.rotate = Double(sender.value)
        let str = String(format: "%.1f", variables!.rotate)
        rotateLabel.text = "Rotate: \(str)"
        del?.rotate()
    }
    
    
    
    
    
    func setUpView(){
        let tapMain = UITapGestureRecognizer(target: self, action: #selector(removeOptions))
        cancelView.addGestureRecognizer(tapMain)
    }
    
    @objc func removeOptions(sender: UITapGestureRecognizer){
        dismiss(animated: true)
    }
    
    @IBAction func ResetButton(_ sender: UIButton) {
        
    }
}
