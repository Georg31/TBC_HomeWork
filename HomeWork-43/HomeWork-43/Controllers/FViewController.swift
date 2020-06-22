//
//  FViewController.swift
//  HomeWork-43
//
//  Created by George Digmelashvili on 6/22/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class FViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    var selected = ""
    var imgs = ["c1", "c2", "c3", "c4", "c5", "c6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
}


extension FViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FVCell", for: indexPath) as! FVCell
        cell.imgView.image = UIImage(named: imgs[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selected = imgs[indexPath.row]
        performSegue(withIdentifier: "detailed", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailed"{
            let vc = segue.destination as! DetailedViewController
            vc.data = selected
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 1.8 - 10, height: self.view.frame.height)
    }
}
