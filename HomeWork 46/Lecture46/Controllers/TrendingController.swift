//
//  TrendingController.swift
//  Lecture46
//
//  Created by George Digmelashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TrendingController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib.init(nibName: "BCell", bundle: nil), forCellWithReuseIdentifier: "BCell")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib.init(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var txt = ["ALL", "Pop", "Hip-Hop", "Jazz", "Electronic", "Folk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}


extension TrendingController: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        cell.countLabel.text = "#\(indexPath.row + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return txt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BCell", for: indexPath) as! BCell
        cell.button.setTitle(txt[indexPath.row], for: .normal)
        return cell
    }
    
    
}
