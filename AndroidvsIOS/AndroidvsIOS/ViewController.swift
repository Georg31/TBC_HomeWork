//
//  ViewController.swift
//  AndroidvsIOS
//
//  Created by George Digmelashvili on 5/21/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var vsImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(
        self,
        selector: #selector(didChoice(with:)),
        name: NSNotification.Name(rawValue: "Choice"),
        object: nil)
    }

    @IBAction func ChooseButton(_ sender: UIButton) {
     
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let newVC = storyboard.instantiateViewController(withIdentifier: "Choice_Page") as? ChoiceController{
            self.show(newVC, sender: self)
        }
    }
    
    
    @objc func didChoice(with notification: Notification) {
        if let userInfo = notification.userInfo {
            vsImgView.image = userInfo["img"] as? UIImage
            textLabel.isHidden = false
            if vsImgView.image?.accessibilityIdentifier == "ios"{
                textLabel.text = "Better Choice"
            }
            else{ textLabel.text = "No one is perfect"}
        }
    }
}

