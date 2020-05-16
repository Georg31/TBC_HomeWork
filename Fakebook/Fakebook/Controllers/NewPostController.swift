//
//  NewPostController.swift
//  Fakebook
//
//  Created by George Digmelashvili on 5/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class NewPostController: UIViewController {

    @IBOutlet weak var PostTextField: UITextView!
    
    var user = UserDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    

    @IBAction func PublishButton(_ sender: UIButton) {
        Dbase.creatPost(PostTextField.text, user)
        self.navigationController?.popViewController(animated: true)
    }
    

}
