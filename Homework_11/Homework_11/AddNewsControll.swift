//
//  AddNewsControll.swift
//  Homework_11
//
//  Created by George Digmelashvili on 4/30/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol addnews {
    func addnew(new: News)
    func refresh()
   
}

class AddNewsControll: UIViewController, IdService {
    

    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var BodyTextField: UITextView!
    @IBOutlet weak var AddSaveButton: UIButton!
    
    var delegate: addnews?
    var isEditingNews = false
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddButton(_ sender: UIButton) {
        if TitleTextField.text!.isEmpty || BodyTextField.text.isEmpty{return}
        let title = TitleTextField.text!
        let body = BodyTextField.text!
        
        let news = News(title, body)
        self.delegate?.addnew(new: news)
        self.delegate?.refresh()
        clear() 
       
    }
    
    func clear(){
        TitleTextField.text = ""
        BodyTextField.text = ""
    }
    
    func editor(news: News){
           isEditingNews = true
           AddSaveButton.setTitle("Save", for: .normal)
           
           let news = news
           
           TitleTextField.text = news.title
           BodyTextField.text = news.body
       
       }
    

}
