//
//  AddNoteController.swift
//  HomeWork_18
//
//  Created by George Digmelashvili on 5/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol Update {
    func update()
}

class AddNoteController: UIViewController {

    @IBOutlet weak var NoteField: UITextView!
    @IBOutlet weak var NameTextField: UITextField!
    
    var delegate: Update?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NameTextField.layer.borderWidth = 1
        
    }
    

    @IBAction func SaveButton(_ sender: UIButton) {
        if NameTextField.text!.isEmpty{return}
        let customManager = CustomFileManager.defaultManager()
        let text = NoteField.text!
        let name = NameTextField.text!
        if customManager.checkIfExists(name: name){
            NameTextField.layer.borderColor = UIColor.red.cgColor
        }
        else {
            customManager.createNote(name: name, text: text)
            NameTextField.layer.borderColor = UIColor.black.cgColor
            delegate?.update()
        }
        
    }
    
    

}
