//
//  shopVC.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/16/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class shopVC: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var plus: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var imgBgView: UIImageView!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var sizeImage: UIImageView!
    @IBOutlet var sizeimage1: UIImageView!
    @IBOutlet var sizeimage2: UIImageView!
    
    var count = 1
    var img = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        imgBgView.layer.cornerRadius = 40
        imgBgView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        plus.layer.cornerRadius = 15
        plus.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        minus.layer.cornerRadius = 15
        minus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imgView.image = UIImage(named: img)
        sizeImage.image = UIImage(named: img)
        sizeImage.alpha = 0.3
        sizeimage1.image = UIImage(named: img)
        sizeimage2.image = UIImage(named: img)
        sizeimage2.alpha = 0.3
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        counterLabel.text = String(count)
    }
    @IBAction func minusButton(_ sender: Any) {
        count -= 1
        counterLabel.text = String(count)
    }
}
