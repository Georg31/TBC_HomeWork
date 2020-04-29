//
//  SecondViewController.swift
//  Login
//
//  Created by George Digmelashvili on 4/24/20.
//  Copyright © 2020 TBC BootCamp. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Congrats!", message:
            "You won 1$", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
}

