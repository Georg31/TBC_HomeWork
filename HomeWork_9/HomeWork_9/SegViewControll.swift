//
//  SegViewControllViewController.swift
//  HomeWork_9
//
//  Created by George Digmelashvili on 4/29/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class SegViewControll: UIViewController {
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    
    
     var prods = [products]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calculate()
    }
    
    func calculate(){
        var psum = 0.0
        var wsum = 0.0
        for i in prods {
            psum += i.price ?? 0.0
            wsum += i.weight ?? 0.0
        }
        PriceLabel.text! += String(psum)
        WeightLabel.text! += String(wsum)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
