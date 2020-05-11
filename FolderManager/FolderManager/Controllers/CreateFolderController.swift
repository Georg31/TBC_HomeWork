//
//  CreateFolderController.swift
//  FolderManager
//
//  Created by George Digmelashvili on 5/11/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol UpdateCells {
    func update()
}

class CreateFolderController: UIViewController {
    var del: UpdateCells?
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var CheckLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

    @IBAction func CreateButton(_ sender: UIButton) {
        if NameTextField.text!.isEmpty{return}
        let FileM = CustomFileManager.defaultManager()
        
        let name = NameTextField.text!
        if !FileM.NewFolder(name: name){CheckLabel.isHidden = false; return}
        else { CheckLabel.isHidden = true; del?.update() }
        NameTextField.text = ""
    }
}


