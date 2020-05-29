//
//  ViewController.swift
//  AnimationHomework28
//
//  Created by George Digmelashvili on 5/27/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var DropView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var AddB: UIButton!
    @IBOutlet var textLabel: UILabel!
    var addBContstaint: NSLayoutConstraint!
    var img = [UIImageView?]()
    var click = true
    
    var imgs = ["f1", "f2", "f3", "f4", "f5", "f6"]
    var dimgs = ["f1", "f2", "f3", "f4", "f5", "f6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.center.x = view.center.x
        textLabel.frame.origin.y = 20
        textLabel.isHidden = true
        DropView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        AddB.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            DropView.topAnchor.constraint(equalTo: super.view.topAnchor),
            DropView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            DropView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            DropView.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: DropView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        addBContstaint = NSLayoutConstraint(item: AddB!, attribute: .top, relatedBy: .equal, toItem: DropView, attribute: .top, multiplier: 1, constant: 40)
        
        DropView.addConstraint(addBContstaint)
        NSLayoutConstraint.activate([
            AddB.trailingAnchor.constraint(equalTo: DropView.trailingAnchor, constant: -25),
            
        ])
    }
    
    
    @IBAction func AddButton(_ sender: UIButton) {
        let width = Double(self.DropView.frame.size.width) / Double(dimgs.count) - 5
        var posX = CGFloat(0)
        var first = true
        var x = 0
        if click{
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 5, options: [], animations: {
                self.DropView.height(constant: 180)
                self.textLabel.isHidden = false
                self.textLabel.frame.origin.y += 45
                self.textLabel.frame.origin.x -= 100
                self.AddB.transform = CGAffineTransform(rotationAngle: .pi / 4)
                self.addBContstaint.constant += 20
                self.view.layoutIfNeeded()
            })
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 5, options: [], animations: {
                for i in self.dimgs{
                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: width))
                    self.DropView.addSubview(imageView)
                    imageView.isUserInteractionEnabled = true
                    imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapPhoto)))
                    imageView.image = UIImage(named: i)
                    if first{
                        imageView.frame.origin.x = 5
                        imageView.frame.origin.y = self.DropView.frame.maxY - CGFloat(width)
                        first = false
                    }
                    else{
                        posX = (CGFloat(width) * CGFloat(x) + 5 * CGFloat(x))
                        imageView.frame.origin.x = posX
                        imageView.frame.origin.y = self.DropView.frame.maxY - CGFloat(width)
                    }
                    x += 1
                }
            })
            click = false
        }
        else{
            UIView.transition(with: self.DropView, duration: 1, options: .transitionFlipFromBottom,
                              animations: {
                                self.textLabel.isHidden = true
                                self.textLabel.frame.origin.y -= 45
                                self.textLabel.frame.origin.x += 100
                                self.AddB.transform = CGAffineTransform(rotationAngle: .pi / 2)
                                self.addBContstaint.constant -= 20
                                self.DropView.alpha = 0
            })
            { (f) in
                self.DropView.alpha = 1
                self.DropView.height(constant: 80)
                for subview in self.DropView.subviews where subview is UIImageView {
                    subview.removeFromSuperview()
                }
                
            }
            click = true
        }
        
        
        
    }
    
    @objc private func tapPhoto(_ sender: UITapGestureRecognizer) {
        let ViewWidth = DropView.frame.width / CGFloat(dimgs.count)
        let location = sender.location(in: DropView).x
        let margin = CGFloat(5)
        click = true
        if location <= ViewWidth{
            imgs.append(imgs.first!)
        }
        else if ViewWidth < location && location < ViewWidth * CGFloat(2) + margin * CGFloat(2){
            imgs.append(imgs[1])
        }
        else if ViewWidth * CGFloat(2) < location && location < ViewWidth * CGFloat(3) + margin * CGFloat(3){
            imgs.append(imgs[2])
        }
        else if ViewWidth * CGFloat(3) < location && location < ViewWidth * CGFloat(4) + margin * CGFloat(4){
            imgs.append(imgs[3])
        }
        else if ViewWidth * CGFloat(4) < location && location < ViewWidth * CGFloat(5) + margin * CGFloat(5){
            imgs.append(imgs[4])
        }
        else if ViewWidth * CGFloat(5) < location && location < ViewWidth * CGFloat(6) + margin * CGFloat(6){
            imgs.append(imgs[5])
        }
        tableView.reloadData()
        
        UIView.transition(with: self.DropView, duration: 1, options: .transitionFlipFromBottom,
                          animations: {
                            self.textLabel.isHidden = true
                            self.textLabel.frame.origin.y -= 45
                            self.textLabel.frame.origin.x += 100
                            self.AddB.transform = CGAffineTransform(rotationAngle: .pi / 2)
                            self.addBContstaint.constant -= 20
                            self.DropView.alpha = 0
        })
        { (f) in
            self.DropView.alpha = 1
            self.DropView.height(constant: 80)
            for subview in self.DropView.subviews where subview is UIImageView {
                subview.removeFromSuperview()
            }
            //self.DropView.layoutIfNeeded()
        }
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
            UIView.transition(with: self.img.last!!, duration: 0.4, options: .transitionFlipFromBottom,
                              animations: {self.img.last!!.alpha = 0})
            { (f) in
                
                self.img.last!!.removeFromSuperview()
                self.img.removeLast()
            }
            
        }
    }
    
    
    
    func imgV(img: String) -> UIImageView{
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: img)
        imageView.center = view.center
        imageView.frame.origin.y = view.frame.size.height
        imageView.layer.zPosition = 2
        
        return imageView
    }
    
}


extension UIView {
    func height(constant: CGFloat) {
        setConstraint(value: constant, attribute: .height)
    }
    
    func width(constant: CGFloat) {
        setConstraint(value: constant, attribute: .width)
    }
    
    func removeConstraint(attribute: NSLayoutConstraint.Attribute) {
        constraints.forEach {
            if $0.firstAttribute == attribute {
                removeConstraint($0)
            }
        }
    }
    
    private func setConstraint(value: CGFloat, attribute: NSLayoutConstraint.Attribute) {
        removeConstraint(attribute: attribute)
        let constraint =
            NSLayoutConstraint(item: self,
                               attribute: attribute,
                               relatedBy: NSLayoutConstraint.Relation.equal,
                               toItem: nil,
                               attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                               multiplier: 1,
                               constant: value)
        self.addConstraint(constraint)
    }
}
