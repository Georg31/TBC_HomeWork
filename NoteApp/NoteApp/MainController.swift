//
//  ViewController.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/14/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user = NoteUsers()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func SignInButton(_ sender: UIButton) {
        if userTextField.text!.isEmpty || passwordTextField.text!.isEmpty{return}
        let user = Dbase.signIn(userTextField.text!, passwordTextField.text!)
        if !user.1{return}
        self.user = user.0
        clear()
        performSegue(withIdentifier: "NotesPage_segue", sender: nil)
        
    }
    
    func clear(){
        userTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "NotesPage_segue"{
            if let noteVc = segue.destination as? NotesViewController {
                noteVc.user = self.user
            }
        }
    }
    
}
