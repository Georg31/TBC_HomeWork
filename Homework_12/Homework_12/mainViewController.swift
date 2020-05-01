//
//  ViewController.swift
//  Homework_12
//
//  Created by George Digmelashvili on 5/1/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class mainViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    
    var cars = [Car]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @IBAction func AddCar(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newsVC = storyBoard.instantiateViewController(withIdentifier: "adding")
        if let unwrappedVC = newsVC as? AddCars{
            unwrappedVC.delegate = self
        }
             
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    @IBAction func topButton(_ sender: UIButton) {
        if cars.isEmpty{return}
        if sender.tag == 0{
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: true)
            
        }
        else {
        
            let index = IndexPath(row: cars.count - 1, section: 0)
            tableView.scrollToRow(at: index, at: .bottom, animated: true)
            
        }
    }
    
}







extension mainViewController: addcar, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Car_List_Cell", for: indexPath) as! CarListCell
        
        let car = cars[indexPath.row]
        cell.img.image = UIImage(named: car.img)
        cell.ModelLabel.text = car.model
        cell.PriceLabel.text = String(car.price)
        
        return cell
    }
    
    func add(car: Car) {
           self.cars.append(car)
           tableView.reloadData()
        let index = IndexPath(row: cars.count - 1, section: 0)
        tableView.scrollToRow(at: index, at: .bottom, animated: true)
       }
   
}
