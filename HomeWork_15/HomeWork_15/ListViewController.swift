//
//  ListViewController.swift
//  HomeWork_15
//
//  Created by George Digmelashvili on 5/5/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    var cat = [String]()
    
    lazy var CategoryCells: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cat_Cell")
        cv.register(UINib(nibName: "CatCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cat_Cell")
        cv.backgroundColor = .black
        return cv
    }()
    
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(CategoryCells)
        NSLayoutConstraint.activate([
            CategoryCells.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            CategoryCells.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            CategoryCells.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            CategoryCells.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cat_Cell", for: indexPath) as! CatCell
        
        cell.CatImgView.image = UIImage(named: cat[indexPath.row])
        
        return cell
    }
    
       
}


extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWith = collectionView.frame.width / 2 - 5
        
        return CGSize(width: itemWith, height: 150)
    }
    
    
    
    
    
}
