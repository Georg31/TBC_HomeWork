//
//  FilterController.swift
//  Podcast20
//
//  Created by George Digmelashvili on 5/13/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class FilterController: UIViewController {

    @IBOutlet weak var TimeFilter: UIDatePicker!
    var del: Services?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func FilterButton(_ sender: UIButton) {
        del?.filter(Int(TimeFilter.countDownDuration))
        dismiss(animated: true, completion: nil)
    }
    

}
