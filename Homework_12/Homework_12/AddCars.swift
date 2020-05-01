//
//  AddCars.swift
//  Homework_12
//
//  Created by George Digmelashvili on 5/1/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol addcar {
    func add(car: Car)
}

class AddCars: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ModelField: UITextField!
    @IBOutlet weak var PriceField: UITextField!
    
    var imgs = Images()
    var img = String()
    var delegate: addcar?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func AddCarButton(_ sender: UIButton) {
        if PriceField.text!.isEmpty || ModelField.text!.isEmpty || img.isEmpty{return}
        if let pr = Int(PriceField.text!){
        let car = Car(img, ModelField.text!, pr)
        self.delegate?.add(car: car)
        }
    }
    
}



extension AddCars: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgs.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image_Cell", for: indexPath) as! ImageCell
        
        let img = imgs.images[indexPath.row]
        cell.CellImages.image = UIImage(named: img)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        img = imgs.images[indexPath.row]
        
    }
    
}
