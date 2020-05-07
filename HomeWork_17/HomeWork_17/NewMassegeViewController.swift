//
//  NewMassegeViewController.swift
//  HomeWork_17
//
//  Created by George Digmelashvili on 5/7/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit


protocol msg {
    func send(chat: Chat)
    func reload()
}

class NewMassegeViewController: UIViewController {
    
    @IBOutlet weak var RecieverTextField: UITextField!
    @IBOutlet weak var SentMassegeTXT: UITextView!
    @IBOutlet weak var MassegeTextField: UITextField!
    var del: msg?
    var imgs = ["f1", "f2", "f3", "f4", "f5", "f6"]
    var txt = String()
    var s: Chat?
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    
    @IBAction func SendButton(_ sender: UIButton) {
        if MassegeTextField.text!.isEmpty || RecieverTextField.text!.isEmpty{return}
        SentMassegeTXT.text += "\n \n" + MassegeTextField.text!
        if txt == RecieverTextField.text {
            s?.text += SentMassegeTXT.text
        }
        else{
            s = Chat(name: RecieverTextField.text!, text: MassegeTextField.text!, image: imgs.randomElement()!)
            del?.send(chat: s!)
        }
        del?.reload()
        txt = RecieverTextField.text!
        MassegeTextField.text = "" 
    }
    
    
}
