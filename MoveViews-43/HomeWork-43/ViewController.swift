//
//  ViewController.swift
//  HomeWork-43
//
//  Created by George Digmelashvili on 6/17/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var iosT: NSLayoutConstraint! = {
        var s = NSLayoutConstraint()
        s.constant = 100
        return s
    }()
    var iosL: NSLayoutConstraint! = {
           var s = NSLayoutConstraint()
           s.constant = 50
           return s
       }()
    var swiftT: NSLayoutConstraint! = {
           var s = NSLayoutConstraint()
           s.constant = 100
           return s
       }()
    var swiftL: NSLayoutConstraint! = {
           var s = NSLayoutConstraint()
           s.constant = 150
           return s
       }()
    
    var touch = [CGPoint]()
    
    let swiftLogo: UIImageView = {
        let s = UIImageView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.image = UIImage(named: "swift")
        s.isUserInteractionEnabled = true
        s.tag = 0
        return s
    }()
    
    let iosLogo: UIImageView = {
        let s = UIImageView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.image = UIImage(named: "ios")
        s.isUserInteractionEnabled = true
        s.tag = 1
        return s
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))
        swiftLogo.addGestureRecognizer(pan)
        let pan2 = UIPanGestureRecognizer(target: self, action: #selector(handleGesture2))
        iosLogo.addGestureRecognizer(pan2)
        view.addSubview(iosLogo)
        view.addSubview(swiftLogo)
        location()
       
        iosT = NSLayoutConstraint(item: iosLogo, attribute: .top, relatedBy: .equal, toItem: super.view, attribute: .top, multiplier: 1, constant: iosT.constant)
        iosL = NSLayoutConstraint(item: iosLogo, attribute: .leading, relatedBy: .equal, toItem: super.view, attribute: .leading, multiplier: 1, constant: iosL.constant)
        self.view.addConstraints([iosT, iosL])
        NSLayoutConstraint.activate([
            iosLogo.widthAnchor.constraint(equalToConstant: 70),
            iosLogo.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        swiftT = NSLayoutConstraint(item: swiftLogo, attribute: .top, relatedBy: .equal, toItem: super.view, attribute: .top, multiplier: 1, constant: swiftT.constant)
        swiftL = NSLayoutConstraint(item: swiftLogo, attribute: .leading, relatedBy: .equal, toItem: super.view, attribute: .leading, multiplier: 1, constant: swiftL.constant)
        self.view.addConstraints([swiftT, swiftL])
        NSLayoutConstraint.activate([
            swiftLogo.widthAnchor.constraint(equalToConstant: 70),
            swiftLogo.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func location(){
        let data = UserDefaults.standard
        let iosLoc = data.array(forKey: "iosLogo")!
        let swiftLoc = data.array(forKey: "swiftLogo")!
        iosL.constant = iosLoc.first as! CGFloat
        iosT.constant = iosLoc.last as! CGFloat
        swiftL.constant = swiftLoc.first as! CGFloat
        swiftT.constant = swiftLoc.last as! CGFloat
    }
    
    @objc func handleGesture(_ sender: UIPanGestureRecognizer){
        switch sender.state {
        case .began:
            swiftLogo.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        case .changed:
            swiftL.constant = sender.location(in: nil).x - swiftLogo.frame.width / 2
            swiftT.constant = sender.location(in: nil).y - swiftLogo.frame.height / 2
        case .ended:
            swiftLogo.transform = CGAffineTransform(scaleX: 1, y: 1)
            UserDefaults.standard.set([swiftLogo.frame.minX, swiftLogo.frame.minY], forKey: "swiftLogo")
        default:
            break
        }
    }
    
    @objc func handleGesture2(_ sender: UIPanGestureRecognizer){
        switch sender.state {
        case .began:
            iosLogo.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        case .changed:
            iosL.constant = sender.location(in: nil).x - iosLogo.frame.width / 2
            iosT.constant = sender.location(in: nil).y - iosLogo.frame.height / 2
        case .ended:
            iosLogo.transform = CGAffineTransform(scaleX: 1, y: 1)
            UserDefaults.standard.set([iosLogo.frame.minX, iosLogo.frame.minY], forKey: "iosLogo")
        default:
            break
        }
    }
    
   
}

