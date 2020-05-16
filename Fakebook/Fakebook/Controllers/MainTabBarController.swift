//
//  MainTabBarController.swift
//  Fakebook
//
//  Created by George Digmelashvili on 5/16/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {

    
    
     var user = UserDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        //super.removeFromParent()
        navigationItem.hidesBackButton = true
       
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add_Post"{
            if let dest = segue.destination as? NewPostController{
                dest.user = self.user
            }
        }
    }
}
