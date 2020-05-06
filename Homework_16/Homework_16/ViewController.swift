//
//  ViewController.swift
//  Homework_16
//
//  Created by George Digmelashvili on 5/6/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UDManager.isLogedIn(){performSegue(withIdentifier: "main_page", sender: nil)}
    }

    @IBAction func regbutton(_ sender: UIButton) {
        performSegue(withIdentifier: "reg_view", sender: nil)
    }
    
    @IBAction func signinbutton(_ sender: UIButton) {
        if UserNameTextField.text!.isEmpty || PasswordTextField.text!.isEmpty{return}
        let s = UDManager.GetUser(user: UserNameTextField.text!)
        if s == "" || s != PasswordTextField.text{
           ErrorLabel.isHidden = false
           return
        }
        UDManager.LogIn()
        performSegue(withIdentifier: "main_page", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "main_page"{
            if let dest = segue.destination as? MainPageView{
                dest.userName = UserNameTextField.text!
            }
        }
    }
}

