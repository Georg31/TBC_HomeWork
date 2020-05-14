//
//  CreateNoteController.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/14/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
protocol refreshService {
    func update()
    func editDone()
    func saw()
}

class CreateNoteController: UIViewController {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var BodyTextView: UITextView!
    
    var OnEdit = false
    var look = false
    var editNote = Notes()
    var user = NoteUsers()
    var del: refreshService?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        checking()
    }
    
    
    func checking(){
        
        if look{
            NameTextField.text = editNote.name
            BodyTextView.text = editNote.notebody
            NameTextField.isUserInteractionEnabled = false
            BodyTextView.isUserInteractionEnabled = false
            del?.saw()
        }else if OnEdit{
            NameTextField.text = editNote.name
            BodyTextView.text = editNote.notebody
        }
    }
    
    @IBAction func SaveButton(_ sender: UIButton) {
        
        if OnEdit{
            Dbase.editNote(editNote, BodyTextView.text!)
            del?.editDone()
        }
        else{
            if NameTextField.text!.isEmpty{return}
            Dbase.createNote(NameTextField.text!, BodyTextView.text, user)
            clear()
            
        }
        navigationController?.popViewController(animated: true)
        del?.update()
    }
    
    func clear(){
        NameTextField.text = ""
        BodyTextView.text = ""
    }
    
}
