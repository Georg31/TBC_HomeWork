//
//  ViewController.swift
//  Homework_9
//
//  Created by George Digmelashvili on 4/27/20.
//  Copyright © 2020 TBC BootCamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NameTextBox: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var EmailTextBox: UITextField!
    @IBOutlet weak var PhoneTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }

    @IBAction func RegButton(_ sender: UIButton) {
        if PhoneTextBox.text!.isEmpty{
            let alertController = UIAlertController(title: "ERROR", message:
                "Fill all inputs", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }
        else{
        performSegue(withIdentifier: "userControl", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = NameTextBox.text ?? ""
        let Lname = LastName.text ?? ""
        let Email = EmailTextBox.text ?? ""
        let phone = PhoneTextBox.text ?? ""
        
        if let des = segue.destination as? ProfileView{
            des.name = name
            des.lastname = Lname
            des.email = Email
            des.phone = phone
        }
    }
}

