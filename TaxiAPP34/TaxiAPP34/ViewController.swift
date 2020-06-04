//
//  ViewController.swift
//  TaxiAPP34
//
//  Created by George Digmelashvili on 6/4/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segment: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        segment.selectedSegmentIndex = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Tab(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1{
            performSegue(withIdentifier: "2ndPage", sender: nil)
        }
        if sender.selectedSegmentIndex == 2 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "page3") as! Page3
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "2ndPage", sender: nil)
    }
}

