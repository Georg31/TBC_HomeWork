//
//  EditNoteController.swift
//  HomeWork_18
//
//  Created by George Digmelashvili on 5/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class EditNoteController: UIViewController{
    
    

    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var BodyLabel: UITextView!
    var header: String?
    var body: String?
    var selectedNote: URL?
    var delegate: Update?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HeaderLabel.text = header
        BodyLabel.text = body
    }
    
    @IBAction func SaveChangesButton(_ sender: UIButton) {
        let customManager = CustomFileManager.defaultManager()
        let text = BodyLabel.text
        customManager.Edit(url: selectedNote!, text: text!)
        delegate?.update()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
  

}
