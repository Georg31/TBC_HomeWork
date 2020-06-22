//
//  DetailedViewController.swift
//  HomeWork-43
//
//  Created by George Digmelashvili on 6/22/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!{
        didSet{
            imgView.image = UIImage(named: data)
        }
    }
    
    var data: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "In-app-purchases"
    }

    
}
