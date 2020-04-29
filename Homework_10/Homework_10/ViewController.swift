//
//  ViewController.swift
//  Homework_10
//
//  Created by George Digmelashvili on 4/29/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var RegCheckLabel: UILabel!
    @IBOutlet weak var NameTextBox: UITextField!
    @IBOutlet weak var LastNameTextBox: UITextField!
    @IBOutlet weak var EmailTextBox: UITextField!
    @IBOutlet weak var GenderSegment: UISegmentedControl!
    var users = [User]()
    var textBox = [UITextField]()
    var segueId = "segue_list_page"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textBox.append(NameTextBox)
        textBox.append(LastNameTextBox)
        textBox.append(EmailTextBox)
        
    }

    @IBAction func RegisterUser(_ sender: UIButton) {
        if !txtvalidator(txtboxs: textBox){return}
        let user = User(NameTextBox.text!, LastNameTextBox.text!, EmailTextBox.text!, GenderSegment.selectedSegmentIndex)
        users.append(user)
        clearAll()
        RegCheckLabel.isHidden = false
        
    }
    
    func clearAll() {
        NameTextBox.text = ""
        LastNameTextBox.text = ""
        EmailTextBox.text = ""
        NameTextBox.becomeFirstResponder()
    }
    
    @IBAction func ShowList(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: segueId, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            
            if identifier == segueId {
                if let dest = segue.destination as? ListTable {
                    dest.users = self.users
                }
            }
            
        }
    }
    
    
    @IBAction func TextChanged(_ sender: UITextField) {
        RegCheckLabel.isHidden = true
        switch sender.restorationIdentifier {
        case "t1":
            sender.layer.borderColor = UIColor.black.cgColor
            return
        case "t2":
            sender.layer.borderColor = UIColor.black.cgColor
            return
        case "t3":
            sender.layer.borderColor = UIColor.black.cgColor
            return
        default:
            return
        }
    }
    

    
    func txtvalidator(txtboxs: [UITextField]) -> Bool {
        var bool = true
        for i in txtboxs{
            bool = txtval(txt: i) && bool
        }
        return bool
    }
 
    func txtval(txt : UITextField) -> Bool{
        if txt.text!.isEmpty{
            txt.layer.borderColor = UIColor.red.cgColor
            return false
        }
        txt.layer.borderColor = UIColor.black.cgColor
        return true
    }

}
