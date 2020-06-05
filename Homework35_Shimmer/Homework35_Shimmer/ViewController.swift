//
//  ViewController.swift
//  Homework35_Shimmer
//
//  Created by George Digmelashvili on 6/5/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
import ShimmerSwift

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var bands = [BandApi]()
    var coins = [RawUsd]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        ApiService.AllCoins{ (getcoins) in
            self.coins.append(contentsOf: getcoins)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Band_Cell", for: indexPath) as! BandCell
        cell.nameLabel.text = coins[indexPath.row].fromsymbol
        cell.startShimmering()
        coins[indexPath.row].imageurl.downloadImage{(img) in
            DispatchQueue.main.async {
                cell.imgView.backgroundColor = nil
                cell.imgView.image = img
                cell.stopShimmering()
            }
        }
        
        return cell
    }
    
}


extension UIView {
    func startShimmering(){
        let light = UIColor.white.cgColor
        let alpha = UIColor.white.withAlphaComponent(0.5).cgColor
        
        let gradient = CAGradientLayer()
        gradient.colors = [alpha, light, alpha]
        gradient.frame = CGRect(x: -self.bounds.size.width, y: 0, width: 3 * self.bounds.size.width, height: self.bounds.size.height)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.525)
        gradient.locations = [0.4, 0.5, 0.6]
        self.layer.mask = gradient
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 0.5
        animation.repeatCount = HUGE
        gradient.add(animation, forKey: nil)
        
        
    }
    func stopShimmering(){
        self.layer.mask = nil
    }
}



extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        let s = "https://www.cryptocompare.com\(self)"
        guard let url = URL(string: s) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}
