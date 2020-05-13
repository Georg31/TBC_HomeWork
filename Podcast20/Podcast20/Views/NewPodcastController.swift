//
//  NewPodcastController.swift
//  Podcast20
//
//  Created by George Digmelashvili on 5/13/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
import CoreData

protocol Services {
    func update()
    func filter(_ dur: Int)
}


class NewPodcastController: UIViewController {
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var AboutTextView: UITextView!
    @IBOutlet weak var DurationPicker: UIDatePicker!
    var storedDate: Date?
    var del: Services?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storedDate = DurationPicker.date
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func CreateButton(_ sender: UIButton) {
        if NameTextField.text!.isEmpty{return}
        SavePod(NameTextField.text!, AboutTextView.text, Int(DurationPicker.countDownDuration))
        del?.update()
        clear()
    }
    
    func clear(){
        NameTextField.text = ""
        AboutTextView.text = ""
        DurationPicker.date = storedDate!
    }
    
}



extension NewPodcastController{
    
    func SavePod(_ name: String, _ about: String, _ duration: Int) {
        let context = AppDelegate.coreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "Podcast", in: context)
        let podcast = Podcast(entity: entityDescription!, insertInto: context)
        
        podcast.name = name
        podcast.about = about
        podcast.duration = Int32(duration)
        do {
            try context.save()
        } catch {}
    }
}
