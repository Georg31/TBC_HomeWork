//
//  MainPageView.swift
//  Homework_16
//
//  Created by George Digmelashvili on 5/6/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class MainPageView: UIViewController {
    @IBOutlet weak var BackGroundColorPicker: UIPickerView!
    @IBOutlet weak var TextEditor: UITextView!
    
    
    
    var pickerColors = ["white", "red", "green", "blue", "yellow"]
    var index = 0
    var userName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        BackGroundColorPicker.delegate = self
        BackGroundColorPicker.dataSource = self
        BackGroundColorPicker.selectRow(UDManager.getColor(), inComponent: 0, animated: true)
        color(row: UDManager.getColor())
    }
    
    
    
    
    @IBAction func LogOutButton(_ sender: UIButton) {
        UDManager.LogOut()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension MainPageView: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerColors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerColors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        color(row: row)
        UDManager.SaveColor(value: row)
    }
    
    func color(row: Int){
        switch row {
        case 0:
            self.view.backgroundColor = .white
        case 1:
            self.view.backgroundColor = .red
        case 2:
            self.view.backgroundColor = .green
        case 3:
            self.view.backgroundColor = .blue
        case 4:
            self.view.backgroundColor = .yellow
        default:
            return
        }
    }
}
