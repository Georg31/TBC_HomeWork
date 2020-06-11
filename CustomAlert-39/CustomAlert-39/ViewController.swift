//
//  ViewController.swift
//  CustomAlert-39
//
//  Created by George Digmelashvili on 6/11/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func alertButton(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: " ", message: "OK my brother", preferredStyle: .alert)
        let imgView = UIImageView(frame: CGRect(x: 120, y: 10, width: 30, height: 30))
        imgView.image = UIImage(systemName: "sun.max.fill")
        let cancel = UIAlertAction(title: "დახურვა", style: .cancel)
        alert.addAction(cancel)
        alert.view.addSubview(imgView)
        self.present(alert, animated: true)
        
    }
    
}

