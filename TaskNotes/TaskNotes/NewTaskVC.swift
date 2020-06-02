//
//  NewTaskVC.swift
//  TaskNotes
//
//  Created by George Digmelashvili on 6/2/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class NewTaskVC: UIViewController {
    
    @IBOutlet var taskField: UITextView!
    @IBOutlet var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        addNotification()
        let task = Task(text: taskField.text, date: datePicker.date)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewTask"), object: nil, userInfo: ["task": task])
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    func addNotification(){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Task"
        content.body = taskField.text
        content.sound = UNNotificationSound.default
        
        let dateComponents = datePicker.calendar.dateComponents([.month, .day, .hour, .minute], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let req = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(req)
    }
}
