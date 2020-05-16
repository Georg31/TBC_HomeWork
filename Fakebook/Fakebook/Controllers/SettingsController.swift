//
//  SettingsController.swift
//  Fakebook
//
//  Created by George Digmelashvili on 5/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
           navigationController?.navigationBar.isHidden = true
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logOutButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
