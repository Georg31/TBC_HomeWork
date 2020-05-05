//
//  ViewController.swift
//  HomeWork_15
//
//  Created by George Digmelashvili on 5/5/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cars = ["c1","c2", "c3","c4","c5","c6","c1","c2", "c3","c4","c5","c6"]
    var movies = ["m1","m2", "m3","m4","m5","m6"]
    var foods = ["f1","f2", "f3","f4","f5","f6"]
    var games = ["g1", "g2", "g3"]
    var category = [[String]]()
    var selected = [String]()
    
    let imgV: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFit
        i.isUserInteractionEnabled = true
        return i
        
    }()
    
    
        
    lazy var CategoryCells: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cat_Cell")
        cv.register(UINib(nibName: "CatCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cat_Cell")
        cv.backgroundColor = .white
        return cv
    }()
    
    override func loadView() {
        super.loadView()
        category = [cars, movies, foods, games]
        selected = category.first!
        imgV.image = UIImage(named: (selected.first)!)
        self.view.addSubview(imgV)
        view.addSubview(CategoryCells)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ImgTap( _ :)))
        imgV.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            CategoryCells.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            CategoryCells.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            CategoryCells.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            CategoryCells.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            imgV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 110),
            imgV.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imgV.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            imgV.bottomAnchor.constraint(equalTo: CategoryCells.topAnchor, constant: -110),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @objc func ImgTap(_ sender: UITapGestureRecognizer){
        performSegue(withIdentifier: "segue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            
            if identifier == "segue" {
                if let destinationVC = segue.destination as? ListViewController {
                    destinationVC.cat = self.selected
                }
            }
            
        }
    }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cat_Cell", for: indexPath) as! CatCell
        
        cell.CatImgView.image = UIImage(named: category[indexPath.row].first!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imgV.image = UIImage(named: category[indexPath.row].first!)
        selected = category[indexPath.row]
        
    }
    
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWith = collectionView.frame.width / 3
        
        return CGSize(width: itemWith, height: 150)
    }
    
    
    
    
    
}
