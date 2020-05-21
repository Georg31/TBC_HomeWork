//
//  ChoiceController.swift
//  AndroidvsIOS
//
//  Created by George Digmelashvili on 5/21/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ChoiceController: UIViewController {
    @IBOutlet var IOSimgView: UIImageView!
    @IBOutlet var AndroidimgView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        IOSimgView.image?.accessibilityIdentifier = "ios"
        AndroidimgView.image?.accessibilityIdentifier = "android"
        IOSimgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapIOS)))
        AndroidimgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAndroid)))
    }
    
    @objc private func tapIOS() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Choice"), object: nil, userInfo: ["img":IOSimgView.image!])
        dismiss(animated: true, completion: nil)
    }

    @objc private func tapAndroid() {
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Choice"), object: nil, userInfo: ["img":AndroidimgView.image!])
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
