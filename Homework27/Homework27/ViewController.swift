//
//  ViewController.swift
//  Homework27
//
//  Created by George Digmelashvili on 5/25/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var primeToField: UITextField!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var calcButton: UIButton!
    var timer: Timer?
    
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @objc func fireTimer(timer: Timer) {
        //print("Timer fired!")
        seconds += 1
        timeLabel.text = String(seconds)
        
    }
    
    @IBAction func CalculatePrimeButton(_ sender: UIButton) {
        if primeToField.text!.isEmpty{return}
        calcButton.isEnabled = false
        seconds = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        let s = Int(primeToField.text!)
        let queue = DispatchQueue(label: "printQueue", attributes: .concurrent)
        let group = DispatchGroup()
        queue.async(group: group){
            self.PrimeNumbers(s!)
        }
        
        group.notify(queue: .main){
            self.timer?.invalidate()
            self.calcButton.isEnabled = true
        }
    }
    
    
    func PrimeNumbers(_ toNum: Int) {
        for num in 4...toNum{
            let root = Int(sqrt(Double(num)))
            for i in 2...root{
                if num % i == 0{break}
                if i == root {print(num)}
            }
        }
    }
}

