//
//  Tab2ViewController.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class tab2: UIViewController {
    var del: switchTab?
    var tabs = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tab1Button(_ sender: UIButton) {
        del?.tabSwitch(index: 0)
    }
    
    @IBAction func tab3Button(_ sender: UIButton) {
        del?.tabSwitch(index: 2)
    }
    
    @IBAction func tab4Button(_ sender: UIButton) {
        del?.tabSwitch(index: 3)
    }
    
}
