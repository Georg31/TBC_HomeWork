//
//  RegisterController.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/14/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func RegButton(_ sender: UIButton) {
        if UserNameTextField.text!.isEmpty || EmailTextField.text!.isEmpty || PasswordTextField.text!.isEmpty{return}
        
        Dbase.regUser(UserNameTextField.text!, EmailTextField.text!, PasswordTextField.text!)
        clear()
        dismiss(animated: true)
    }
    
    func clear(){
        UserNameTextField.text = ""
        EmailTextField.text = ""
        PasswordTextField.text = ""
    }
}
