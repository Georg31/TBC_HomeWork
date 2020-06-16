//
//  CustomTabBarViewController.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UIViewController, switchTab {
    
    
    
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
        tab1.tabs = self.tabs
        tab1.del = self
        tab2.tabs = self.tabs
        tab2.del = self
        tab3.tabs = self.tabs
        tab3.del = self
        tab4.tabs = self.tabs
        tab4.del = self
        //present(tab1, animated: false)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tabSwitch(index: index)
    }
    
    func tabSwitch(index: Int) {
        self.index = index
//        self.addChild(tabs[index])
//        self.view.addSubview(tabs[index].view)
//        tabs[index].view.frame = view.bounds
//        tabs[index].didMove(toParent: self)
        UIApplication.shared.windows.first?.rootViewController = tabs[index]
        
    }
    
}
