//
//  CustomTabBarViewController.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UIViewController {
    
    
    @IBOutlet var customTabBar: UIView!{
        didSet{
            customTabBar.layer.cornerRadius = 46
            customTabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            customTabBar.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            customTabBar.layer.zPosition = 1
        }
    }
    @IBOutlet var tabView: UIView!
    @IBOutlet var homebutton: UIButton!
    var selectedButton = UIButton()
    var tabs = [UIViewController]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let tab1 = sb.instantiateViewController(withIdentifier: "tab1") as! tab1
        let tab2 = sb.instantiateViewController(withIdentifier: "tab2") as! tab2
        let tab3 = sb.instantiateViewController(withIdentifier: "tab3") as! tab3
        let tab4 = sb.instantiateViewController(withIdentifier: "tab4") as! tab4
        tabs.append(contentsOf: [tab1, tab2, tab3, tab4])
        selectedButton = homebutton
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tabSwitch(index: index)
    }
    
    
    @IBAction func tabButton(_ sender: UIButton) {
        selectedButton.alpha = 0.5
        selectedButton = sender
        selectedButton.alpha = 1
        tabSwitch(index: sender.tag)
    }
    
    
    func tabSwitch(index: Int) {
        tabs[self.index].removeFromParent()
        self.index = index
        self.tabView.addSubview(tabs[index].view)
        tabs[index].view.frame = view.bounds
        
    }
    
}
