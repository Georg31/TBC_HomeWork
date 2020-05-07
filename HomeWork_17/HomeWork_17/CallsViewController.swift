//
//  CallsViewController.swift
//  HomeWork_17
//
//  Created by George Digmelashvili on 5/7/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class CallsViewController: UIViewController {
    @IBOutlet weak var Table: UITableView!
    var contacts =
    [
        Contact(phone: "555999111", country: "GEORGIA"),
        Contact(phone: "599222333", country: "GEORGIA"),
        Contact(phone: "5555459111", country: "RUSSIA"),
        Contact(phone: "8782454545455", country: "USA"),
        Contact(phone: "457854354", country: "ENGLAND"),
        Contact(phone: "7858545545", country: "POLAND"),
        Contact(phone: "555999111", country: "GEORGIA"),
        Contact(phone: "599222333", country: "GEORGIA"),
        Contact(phone: "5555459111", country: "RUSSIA"),
        Contact(phone: "8782454545455", country: "USA"),
        Contact(phone: "457854354", country: "ENGLAND"),
        Contact(phone: "7858545545", country: "POLAND"),
        Contact(phone: "555999111", country: "GEORGIA"),
        Contact(phone: "599222333", country: "GEORGIA"),
        Contact(phone: "5555459111", country: "RUSSIA"),
        Contact(phone: "8782454545455", country: "USA"),
        Contact(phone: "457854354", country: "ENGLAND"),
        Contact(phone: "7858545545", country: "POLAND")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Table.delegate = self
        Table.dataSource = self
    }
    

    

}

extension CallsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = self.contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Call_Cell", for: indexPath) as! CallsCell
        cell.phoneLabel.text = user.phone
        cell.countryLabel.text = user.country
        cell.dateLabel.text = user.date
        
        return cell
    }
    
    
}
