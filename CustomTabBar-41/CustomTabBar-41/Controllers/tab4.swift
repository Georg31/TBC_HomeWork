//
//  tab4.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class tab4: UIViewController {
    
    var del: switchTab?
    var tabs = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tab1(_ sender: Any) {
        del?.tabSwitch(index: 0)
    }
    
    @IBAction func tab2(_ sender: Any) {
        del?.tabSwitch(index: 1)
    }
    
    @IBAction func tab3(_ sender: Any) {
        del?.tabSwitch(index: 2)
    }
    
    
}
