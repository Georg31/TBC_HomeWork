//
//  SettingsViewController.swift
//  HomeWork_17
//
//  Created by George Digmelashvili on 5/7/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var Table: UITableView!
    
    
    var settings = ["change name", "change password", "logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Table.delegate = self
        Table.dataSource = self
    }
    


}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let set = self.settings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingsCell
        cell.settingLabel.text = set
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(settings[indexPath.row])
    }
    
}
