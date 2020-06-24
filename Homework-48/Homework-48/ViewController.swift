//
//  ViewController.swift
//  Homework-48
//
//  Created by George Digmelashvili on 6/24/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index = (-1, false)
    let info = "click for info"
    let fullinfo = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath) as! ResizeableCell
        if indexPath.row == index.0 {
            if index.1 && cell.txtLabel.text != info{
                cell.txtLabel.text = info
                cell.txtLabel.textColor = #colorLiteral(red: 1, green: 0.2016660048, blue: 0.1306692334, alpha: 1)
                index.1 = false
            }
            else{
                cell.txtLabel.text = fullinfo
                cell.txtLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
        else{
            cell.txtLabel.text = info
            cell.txtLabel.textColor = #colorLiteral(red: 1, green: 0.2016660048, blue: 0.1306692334, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if index.0 == indexPath.last{
            index.1 = true
        }
        else{ index.0 = indexPath.last!; index.1 = false}
        tableView.reloadData()
    }
}
