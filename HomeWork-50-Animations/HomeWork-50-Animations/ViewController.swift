//
//  ViewController.swift
//  HomeWork-50-Animations
//
//  Created by George Digmelashvili on 6/29/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
class Variables {
    var duration = 1.0
    var delay = 0.0
    var damping = 0.4
    var velocity = 0.0
    var rotate = 0.8
    var x = 0
    var y = 0
    var scale = 1.0
    var animation: String?
    var options: UIView.AnimationOptions?
    var isCircle = false
}

class ViewController: UIViewController {
    
    @IBOutlet var shapeStack: UIStackView!
    @IBOutlet var circle: UIImageView!
    @IBOutlet var square: UIImageView!
    @IBOutlet var mainShape: UIView!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var animationPicker: UIPickerView!
    
    var variables = Variables()
    var animations = [["shake", "squeeze", "rotate"],
                      ["Linear", "easeIn", "easeOut"]]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    @IBAction func AnimateButton(_ sender: UIButton) {
        switch variables.animation {
        case "shake":
            mainShape.shake(for: variables.duration, delay: variables.delay, damping: CGFloat(variables.damping), velocity: CGFloat(variables.velocity), options: variables.options!)
        case "squeeze":
            mainShape.squeeze(for: variables.duration, delay: variables.delay, damping: CGFloat(variables.damping), velocity: CGFloat(variables.velocity), options: variables.options!)
        case "rotate":
            mainShape.rotate(for: variables.duration, delay: variables.delay, damping: CGFloat(variables.damping), velocity: CGFloat(variables.velocity), options: variables.options!)
        default:
            break
        }
    }
    
    @IBAction func durationValueChange(_ sender: UISlider) {
        variables.duration = Double(sender.value)
        let str = String(format: "%.1f", variables.duration)
        durationLabel.text = "Duration: \(str)"
        
    }
    
    @IBAction func delayValueChange(_ sender: UISlider) {
        variables.delay = Double(sender.value)
        let str = String(format: "%.1f", variables.delay)
        delayLabel.text = "Delay: \(str)"
    }
    
    
    
    @objc func ShapeChanger(sender: UITapGestureRecognizer){
        mainShape.layer.cornerRadius = variables.isCircle ? 5 : 25
        variables.isCircle.toggle()
    }
    
    func setUpViews(){
        mainShape.translatesAutoresizingMaskIntoConstraints = false
        mainShape.center = view.center
        mainShape.frame = CGRect(x: mainShape.frame.origin.x, y: view.frame.height / 3, width: 50, height: 50)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ShapeChanger))
        shapeStack.addGestureRecognizer(tap)
        animationPicker.dataSource = self
        animationPicker.delegate = self
        variables.animation = animations.first?.first
        variables.options = UIView.AnimationOptions(curve: animations.last!.first!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "options"{
            let vc = segue.destination as! OptionsVC
            vc.del = self
            vc.variables = self.variables
        }
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate, animate{
    func rotate() {
        mainShape.transform = CGAffineTransform(rotationAngle: CGFloat(.pi * variables.rotate))
    }
    
    func scale() {
        mainShape.transform = CGAffineTransform(scaleX: CGFloat(variables.scale), y: CGFloat(variables.scale))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return animations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.first!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animations[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{ variables.animation = animations[0][row] }
        else {variables.options = UIView.AnimationOptions(curve: animations[1][row])}
        
    }
    
}

extension UIView {
    
    func shake(for duration: TimeInterval, delay: TimeInterval, damping: CGFloat, velocity: CGFloat, options: UIView.AnimationOptions) {
        self.transform = CGAffineTransform(translationX: 40, y: 0)
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
        func  squeeze(for duration: TimeInterval, delay: TimeInterval, damping: CGFloat, velocity: CGFloat, options: UIView.AnimationOptions){
            self.transform = CGAffineTransform(scaleX: 3, y: 1.5)
            UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: {
                self.transform = CGAffineTransform.identity
            }) { (check) in
                
            }
        }
        func  rotate(for duration: TimeInterval, delay: TimeInterval, damping: CGFloat, velocity: CGFloat, options: UIView.AnimationOptions){
            self.transform = CGAffineTransform(rotationAngle: .pi)
            UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: {
                self.transform = CGAffineTransform.identity
            }) { (check) in
                
            }
        }
    
}

extension UIView.AnimationOptions {
    init(curve: String) {
        switch curve {
        case "Linear":
            self = .curveLinear
        case "easeIn":
            self = .curveEaseIn
        case "easeOut":
            self = .curveEaseOut
        default:
            fatalError()
        }
    }
}
