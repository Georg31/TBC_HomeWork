//
//  Page3.swift
//  TaxiAPP34
//
//  Created by George Digmelashvili on 6/4/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class Page3: UIViewController {
    @IBOutlet var button: UIButton!{
        didSet{
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 6
            button.layer.borderColor = #colorLiteral(red: 0.1137254902, green: 0.1411764706, blue: 0.5333333333, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func seg(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "page2") as! Page2
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if sender.selectedSegmentIndex == 0{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "page2") as! Page2
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}
