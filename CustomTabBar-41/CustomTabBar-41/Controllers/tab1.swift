//
//  ViewController.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol switchTab {
    func tabSwitch(index: Int)
}

class tab1: UIViewController {
    
    var del: switchTab?
    var tabs = [UIViewController]()
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var tabView: UIView!
    @IBOutlet var tableView: UITableView!
    var imgs = ["Cappuccino", "Espresso", "latte", "macciato", "Mocha"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabView.layer.cornerRadius = 46
        tabView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tableView.delegate = self
        tableView.dataSource = self
        textColor()
    }
    
    
    @IBAction func tab2Button(_ sender: UIButton) {
        del?.tabSwitch(index: 1)
    }
    
    @IBAction func tab3Button(_ sender: UIButton) {
        del?.tabSwitch(index: 2)
    }
    
    @IBAction func tab4Button(_ sender: UIButton) {
        del?.tabSwitch(index: 3)
    }
    
    
    func textColor(){
        let text = "It's Great Day for\nCoffee."
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text)
        attributedString.setColorForText(textForAttribute: "Day", withColor: #colorLiteral(red: 0.7254901961, green: 0.5333333333, blue: 0.4588235294, alpha: 1))
        attributedString.setColorForText(textForAttribute: "for", withColor: #colorLiteral(red: 0.7254901961, green: 0.5333333333, blue: 0.4588235294, alpha: 1))
        attributedString.setColorForText(textForAttribute: "Coffee.", withColor: #colorLiteral(red: 0.7254901961, green: 0.5333333333, blue: 0.4588235294, alpha: 1))
        headerLabel.attributedText = attributedString
    }
    
}



extension tab1: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell", for: indexPath) as! CoffeeCell
        cell.setData(imgs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shop = UIStoryboard(name: "tab1", bundle: nil).instantiateViewController(withIdentifier: "shop") as! shopVC
        shop.img = imgs[indexPath.row]
        present(shop, animated: false)
    }
    
    
}

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
}
