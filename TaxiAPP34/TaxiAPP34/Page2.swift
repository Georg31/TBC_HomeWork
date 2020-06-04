//
//  Page2.swift
//  TaxiAPP34
//
//  Created by George Digmelashvili on 6/4/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class Page2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func seg(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 2{
                   let vc = storyboard?.instantiateViewController(withIdentifier: "page3") as! Page3
                   self.navigationController?.pushViewController(vc, animated: true)
               }
               if sender.selectedSegmentIndex == 0{
                   self.navigationController?.popToRootViewController(animated: true)
               }
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "page3") as! Page3
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
