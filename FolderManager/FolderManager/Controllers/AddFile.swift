//
//  AddFile.swift
//  FolderManager
//
//  Created by George Digmelashvili on 5/11/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol updateFiles {
    func update()
    func editDone()
}

class AddFile: UIViewController {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var BodyText: UITextView!
    var url: URL?
    var fileEdit: URL?
    var del: updateFiles?
    var check = false
    var look = false
    
    
    override func viewWillDisappear(_ animated: Bool) {
        del?.editDone()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NameTextField.layer.borderWidth = 1
        if check{
            changer()
        }
        if look{
            looking()
        }
    }
    
    func looking(){
        changer()
        BodyText.isEditable = false
        button.isHidden = true
    }
    
    func changer(){
        NameTextField.isEnabled = false
        let fm = CustomFileManager.defaultManager()
        let txt = fm.readText(url: fileEdit!)
        NameTextField.text = fileEdit?.lastPathComponent
        BodyText.text = txt
    }
    
    
    @IBAction func SaveButton(_ sender: UIButton) {
        if NameTextField.text!.isEmpty{return}
        let fm = CustomFileManager.defaultManager()
        if !check{
            let text = BodyText.text!
            let name = NameTextField.text!
            if fm.checkIfExists(name: name, url: url!){
                NameTextField.layer.borderColor = UIColor.red.cgColor
            }
            else {
                fm.createNote(name: name, text: text, url: url!)
                NameTextField.layer.borderColor = UIColor.black.cgColor
                NameTextField.text = ""
                BodyText.text = ""
                del?.update()
            }
        }
        else{
            let txt = BodyText.text
            fm.Edit(url: fileEdit!, text: txt!)
            del?.editDone()
        }
    }
    
}
