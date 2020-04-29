//
//  ViewController.swift
//  SimpleCalc
//
//  Created by George Digmelashvili on 4/23/20.
//  Copyright © 2020 TBC BootCamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var A: UITextField!
    @IBOutlet weak var B: UITextField!
    @IBOutlet weak var Answer: UILabel!
    @IBOutlet weak var segm: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }

   
        
    @IBAction func Calculate(_ sender: UIButton) {
       
        let a = Int(A.text!)
        let b = Int(B.text!)
        switch segm.selectedSegmentIndex {
        case 0:
            Answer.text = String(a! + b!)
        case 1:
            Answer.text = String(a! - b!)
        case 2:
            Answer.text = String(a! / b!)
        case 3:
            Answer.text = String(a! * b!)
            
        default:
            return
        }
}
    
    
    @IBAction func FontSize(_ sender: UISlider) {
        Answer.font = Answer.font.withSize(CGFloat(sender.value))
    }
    
}

