//
//  ViewController.swift
//  AnimationHomework28
//
//  Created by George Digmelashvili on 5/27/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    var img = [UIImageView?]()
    
    var imgs = ["f1", "f2", "f3", "f4", "f5", "f6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, CAAnimationDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food_Cell", for: indexPath) as! FoodCell
        cell.imgView?.image = UIImage(named: imgs[indexPath.row])
        cell.nameLabel.text = imgs[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        img.append(imgV(img: imgs[indexPath.row]))
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 5, options: [], animations: {
            self.img.last!!.frame.origin.y -= 350
        }) {(f) in
            let anim = CABasicAnimation(keyPath: "transform")
            anim.fromValue = CATransform3DMakeRotation(0.5, 1, 0, 0)
            anim.toValue = CATransform3DMakeRotation(-0.5, 1, 0, 0)
            anim.duration = 1
            anim.delegate = self
            anim.repeatCount = 1
            self.img.last!!.layer.add(anim, forKey: "transform")
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        img.first!?.removeFromSuperview()
        img.removeFirst()
    }
    
    func imgV(img: String) -> UIImageView{
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: img)
        imageView.center = view.center
        imageView.frame.origin.y = view.frame.size.height
        imageView.layer.zPosition = 2
        let transformLayer = CATransformLayer()
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 500
        transformLayer.transform = perspective
        transformLayer.addSublayer(imageView.layer)
        view.layer.addSublayer(transformLayer)
        
        return imageView
    }
    
}
