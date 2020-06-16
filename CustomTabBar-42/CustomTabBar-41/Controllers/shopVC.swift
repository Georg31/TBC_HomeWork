//
//  shopVC.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/16/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class shopVC: UIViewController {
    
    @IBOutlet var imgView: UIImageView!{
        didSet{
            imgView.image = UIImage(named: img)
            }
    }
    @IBOutlet var plus: UIButton!{
        didSet{
            plus.layer.cornerRadius = 15
            plus.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        }
    }
    @IBOutlet var minus: UIButton!{
        didSet{
            minus.layer.cornerRadius = 15
            minus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        }
    }
    @IBOutlet var imgBgView: UIImageView!{
        didSet{  imgBgView.layer.cornerRadius = 40
            imgBgView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var sizeImage: UIImageView!{
        didSet{
            sizeImage.image = UIImage(named: img)
            sizeImage.alpha = 0.3
        }
    }
    @IBOutlet var sizeimage1: UIImageView!{
        didSet{ sizeimage1.image = UIImage(named: img)}
    }
    @IBOutlet var sizeimage2: UIImageView!{
        didSet{
            sizeimage2.image = UIImage(named: img)
            sizeimage2.alpha = 0.3
        }
    }
    
    var count = 1
    var img = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        counterLabel.text = String(count)
    }
    @IBAction func minusButton(_ sender: Any) {
        if count <= 1{return}
        count -= 1
        counterLabel.text = String(count)
    }
}
