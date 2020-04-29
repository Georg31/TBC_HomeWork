//
//  ViewController.swift
//  HomeWork_9
//
//  Created by George Digmelashvili on 4/28/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Counter: UILabel!
    @IBOutlet weak var NameTextBox: UITextField!
    @IBOutlet weak var WeightTextBox: UITextField!
    @IBOutlet weak var PriceTextBox: UITextField!
    @IBOutlet weak var TypePicker: UIPickerView!
    var prod = [products]()
    var type = [String]()
    var seg = "segue_page"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TypePicker.delegate = self
        TypePicker.dataSource = self
        type = ["cat1", "cat2", "cat3", "cat4", "cat5"]
    }
    
    func AddTypes(){
        
    }

    @IBAction func AddButton(_ sender: UIButton) {
        if NameTextBox.text!.isEmpty || WeightTextBox.text!.isEmpty || PriceTextBox.text!.isEmpty{
            return
        }
        let w = WeightTextBox.text ?? ""
        let p = PriceTextBox.text ?? ""
        let price = Double(p) ?? 0.0
        let weight = Double(w) ?? 0.0
        
        let prodcut = products(NameTextBox.text ?? "", type[TypePicker.selectedRow(inComponent: 0)], weight, price)
        prod.append(prodcut)
        Counter.text = "\(prod.count)"
       
    }
    @IBAction func Calculate(_ sender: UIButton) {
        performSegue(withIdentifier: seg, sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ident = segue.identifier{
            if ident == seg {
                if let dest = segue.destination as? SegViewControll {
                    dest.prods = self.prod
                }
            }
        }
    }
    
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
}

