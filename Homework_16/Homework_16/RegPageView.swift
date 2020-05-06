//
//  RegPageView.swift
//  Homework_16
//
//  Created by George Digmelashvili on 5/6/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class RegPageView: UIViewController {

    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var UserTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var RetypeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegButton(_ sender: UIButton) {
        if !register(){return}
        print(UDManager.GetUser(user: UserTextField.text!))
    }
    
    
    func register() -> Bool{
        if UserTextField.text!.isEmpty || EmailTextField.text!.isEmpty || PasswordTextField.text!.isEmpty || PasswordTextField.text! != RetypeTextField.text! || UDManager.exists(key: UserTextField.text!){
            checkLabel.isHidden = false
            return false
        }
        else{
            UDManager.RegUser(value: PasswordTextField.text!, key: UserTextField.text!)
            self.navigationController?.popToRootViewController(animated: true)
            return true
        }
    }

}
