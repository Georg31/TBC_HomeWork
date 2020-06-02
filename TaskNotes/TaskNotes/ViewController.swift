//
//  ViewController.swift
//  TaskNotes
//
//  Created by George Digmelashvili on 6/2/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks = [Task]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        notificationPermission()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(NewTask(with:)),
            name: NSNotification.Name(rawValue: "NewTask"),
            object: nil)
    }
    
    
    
    
    @objc func NewTask(with notification: Notification){
        if let userInfo = notification.userInfo {
            let task = userInfo["task"] as! Task
            tasks.append(task)
            self.tableView.reloadData()
        }
    }
    
    
    
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task_Cell", for: indexPath) as! TaskCell
        cell.textField.text = tasks[indexPath.row].text
        let dateformater = DateFormatter()
        dateformater.dateFormat = "hh:mm a/dd/MM"
        cell.dateLabel.text = dateformater.string(from: tasks[indexPath.row].date)
        
        return cell
    }
    
    
    func notificationPermission(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, err) in
            if granted {
                
            } else {
                
            }
        }
        
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .denied {
                DispatchQueue.main.async {
                    self.showLetterAboutPermissionDenied()
                }
            }
        }
    }
    
    
    private func showLetterAboutPermissionDenied() {
        let alert = UIAlertController(title: "ყურადღება", message: "სამწუხაროდ თქვენ შეტყობინებებს ვერ მიიღებთ რადგან უარი გვითხარით მათ გამოგზავნაზე. თუ გსურთ რომ მიიღოთ შეტყობინებები გადადით პარამეტრებში და გააქტიურეთ შეტყობინებების გამოგზავნის შესაძლებლობა", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "პარამეტრები", style: .default, handler: { (action) in
            self.openAppSettings()
        }))
        alert.addAction(UIAlertAction(title: "გაუქმება", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    private func openAppSettings() {
        if let url = URL(string:UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
}
