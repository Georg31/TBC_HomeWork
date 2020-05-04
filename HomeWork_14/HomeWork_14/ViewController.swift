//
//  ViewController.swift
//  HomeWork_14
//
//  Created by George Digmelashvili on 5/4/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var Vtags = -1
    var redVc: NSLayoutConstraint!
    var redVc2: NSLayoutConstraint!
    var blueVc: NSLayoutConstraint!
    var blueVc2: NSLayoutConstraint!
    var W = CGFloat(50)
    var H = CGFloat(50)
    
    
    let slider: UISlider = {
        let s = UISlider()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.minimumValue = 1
        s.maximumValue = 2
        s.isContinuous = true
        s.addTarget(self, action: #selector(ViewController.sliderValueDidChange(_:)), for: .valueChanged)
        return s

    }()
    
    
    
    let masterV: UIView = {
        let m = UIView()
        m.translatesAutoresizingMaskIntoConstraints = false
        m.backgroundColor = .orange
        return m
    }()
    
    let redV: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.isUserInteractionEnabled = true
        v.tag = 0
        return v
    }()
    
    let BlueV: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        v.isUserInteractionEnabled = true
        v.tag = 1
        return v
    }()
    
    let HeightF: UITextField = {
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.font = UIFont.systemFont(ofSize: 15)
        f.borderStyle = UITextField.BorderStyle.roundedRect
        f.placeholder = "Height"
        return f
    }()
    
    let WidthF: UITextField = {
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.font = UIFont.systemFont(ofSize: 15)
        f.borderStyle = UITextField.BorderStyle.roundedRect
        f.placeholder = "Width"
        return f
    }()
    
    
    let button: UIButton = {
    let b = UIButton()
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle("Resize", for: .normal)
    b.addTarget(self, action: #selector(click), for: .touchUpInside)
    b.backgroundColor = .gray
    b.layer.cornerRadius = 10
    b.layer.borderColor = UIColor.red.cgColor
    b.layer.borderWidth = 1
    
    return b
    }()
    
    let up: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage.init(systemName: "arrow.up"), for: UIControl.State.normal)
        b.addTarget(self, action: #selector(upC), for: .touchUpInside)
        b.layer.cornerRadius = 2
        b.layer.borderColor = UIColor.black.cgColor
        b.layer.borderWidth = 1
        return b
    }()
    
    let down: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage.init(systemName: "arrow.down"), for: UIControl.State.normal)
        b.addTarget(self, action: #selector(downC), for: .touchUpInside)
        b.layer.cornerRadius = 2
        b.layer.borderColor = UIColor.black.cgColor
        b.layer.borderWidth = 1
        return b
    }()
    
    let left: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage.init(systemName: "arrow.left"), for: UIControl.State.normal)
        b.addTarget(self, action: #selector(leftC), for: .touchUpInside)
        b.layer.cornerRadius = 2
        b.layer.borderColor = UIColor.black.cgColor
        b.layer.borderWidth = 1
        return b
    }()
    
    let right: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage.init(systemName: "arrow.right"), for: UIControl.State.normal)
        b.addTarget(self, action: #selector(rightC), for: .touchUpInside)
        b.layer.cornerRadius = 2
        b.layer.borderColor = UIColor.black.cgColor
        b.layer.borderWidth = 1
        return b
    }()
    
    
    
    
    override func loadView() {
        super.loadView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.firstV(_ :)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.secondV(_ :)))
        view.addSubview(masterV)
        view.addSubview(redV)
        view.addSubview(BlueV)
        view.addSubview(WidthF)
        view.addSubview(HeightF)
        view.addSubview(button)
        view.addSubview(up)
        view.addSubview(down)
        view.addSubview(left)
        view.addSubview(right)
        view.addSubview(slider)
        redV.addGestureRecognizer(tap)
        redV.tag = 1
        BlueV.addGestureRecognizer(tap2)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#function)
        
        NSLayoutConstraint.activate([
            up.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            up.topAnchor.constraint(equalTo: WidthF.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            left.topAnchor.constraint(equalTo: up.bottomAnchor, constant: 30),
            left.trailingAnchor.constraint(equalTo: up.leadingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            right.topAnchor.constraint(equalTo: left.topAnchor),
            right.leadingAnchor.constraint(equalTo: up.trailingAnchor, constant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            down.topAnchor.constraint(equalTo: left.bottomAnchor, constant: 30),
            down.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            masterV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            masterV.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            masterV.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            masterV.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            
        ])
        
        redVc = NSLayoutConstraint(item: redV, attribute: .top, relatedBy: .equal, toItem: masterV, attribute: .top, multiplier: 1, constant: 100)
        redVc2 = NSLayoutConstraint(item: redV, attribute: .leading, relatedBy: .equal, toItem: masterV, attribute: .leading, multiplier: 1, constant: 50)
        self.view.addConstraints([redVc2, redVc])
        NSLayoutConstraint.activate([
            redV.widthAnchor.constraint(equalToConstant: 50),
            redV.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        blueVc = NSLayoutConstraint(item: BlueV, attribute: .top, relatedBy: .equal, toItem: masterV, attribute: .top, multiplier: 1, constant: 100)
        blueVc2 = NSLayoutConstraint(item: BlueV, attribute: .trailing, relatedBy: .equal, toItem: masterV, attribute: .trailing, multiplier: 1, constant: -50)
        self.view.addConstraints([blueVc, blueVc2])
        NSLayoutConstraint.activate([
            BlueV.widthAnchor.constraint(equalToConstant: 50),
            BlueV.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            HeightF.topAnchor.constraint(equalTo: masterV.bottomAnchor, constant: 10),
            HeightF.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            HeightF.trailingAnchor.constraint(equalTo: WidthF.leadingAnchor, constant: -20)
            
        ])
        
        NSLayoutConstraint.activate([
            WidthF.topAnchor.constraint(equalTo: HeightF.topAnchor),
            WidthF.widthAnchor.constraint(equalTo: HeightF.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: HeightF.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button.widthAnchor.constraint(equalTo: HeightF.widthAnchor),
            button.leadingAnchor.constraint(equalTo: WidthF.trailingAnchor, constant: 20)
            
        ])
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: down.bottomAnchor, constant: 50),
            slider.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            slider.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
            
        ])
        
    }

    
    @objc func firstV(_ sender: UITapGestureRecognizer){
        
        redV.layer.borderColor = UIColor.green.cgColor
        redV.layer.borderWidth = 1
        BlueV.layer.borderWidth = 0
        Vtags = 0
    }
    
    @objc func secondV(_ sender: UITapGestureRecognizer){
        
        redV.layer.borderWidth = 0
        BlueV.layer.borderColor = UIColor.green.cgColor
        BlueV.layer.borderWidth = 1
        Vtags = 1
    }
    
    @objc func click(){
        if HeightF.text!.isEmpty || WidthF.text!.isEmpty || Vtags == -1{return}
        print(Vtags)
         H = CGFloat(Int(HeightF.text!)!)
         W = CGFloat(Int(WidthF.text!)!)
        
        if Vtags == 1{
            BlueV.height(constant: H)
            BlueV.width(constant: W)
        }
        else{
            redV.height(constant: H)
            redV.width(constant: W)
        }
    }
    
    @objc func upC(){
        if Vtags == -1{return}
        if Vtags == 0{
        if redVc.constant < 5{return}
        redVc.constant -= 5
        }
        else{
            blueVc.constant -= 5
        }
    }
    
    @objc func downC(){
         if Vtags == -1{return}
        if Vtags == 0{
        redVc.constant += 5
        }
        else{
            blueVc.constant += 5
        }
    }
    
    @objc func rightC(){
         if Vtags == -1{return}
         if Vtags == 0{
               redVc2.constant += 5
               }
               else{
                   blueVc2.constant += 5
               }
    }
    
    @objc func leftC(){
         if Vtags == -1{return}
         if Vtags == 0{
               redVc2.constant -= 5
               }
               else{
                   blueVc2.constant -= 5
               }
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
       {
        if Vtags == -1{return}
        let val = sender.value
        var h = Float(H), w = Float(W)
        h *= val
        w *= val
        print(h, w)
        
        if Vtags == 0 {
            redV.width(constant: CGFloat(w))
            redV.height(constant: CGFloat(h))
        }
           
       }
}




    
    
    
    
extension UIView {
  func height(constant: CGFloat) {
    setConstraint(value: constant, attribute: .height)
  }
  
  func width(constant: CGFloat) {
    setConstraint(value: constant, attribute: .width)
  }
  
  func removeConstraint(attribute: NSLayoutConstraint.Attribute) {
    constraints.forEach {
      if $0.firstAttribute == attribute {
        removeConstraint($0)
      }
    }
  }
  
    private func setConstraint(value: CGFloat, attribute: NSLayoutConstraint.Attribute) {
    removeConstraint(attribute: attribute)
    let constraint =
      NSLayoutConstraint(item: self,
                         attribute: attribute,
                         relatedBy: NSLayoutConstraint.Relation.equal,
                         toItem: nil,
                         attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                         multiplier: 1,
                         constant: value)
    self.addConstraint(constraint)
  }
}
    
    
    
     

