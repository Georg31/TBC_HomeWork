//
//  ExploreTab.swift
//  Lecture46
//
//  Created by George Digmelashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ExploreTab: UIViewController {
    
    
    @IBOutlet var FcollectionView: UICollectionView!{
        didSet{
            FcollectionView.register(UINib.init(nibName: "FCell", bundle: nil), forCellWithReuseIdentifier: "FCell")
            FcollectionView.delegate = self
            FcollectionView.dataSource = self
        }
    }
    @IBOutlet var ScollectionView: UICollectionView!{
        didSet{
            ScollectionView.register(UINib.init(nibName: "SCell", bundle: nil), forCellWithReuseIdentifier: "SCell")
            ScollectionView.delegate = self
            ScollectionView.dataSource = self
        }
    }
    
    @IBOutlet var TcollectionView: UICollectionView!{
        didSet{
            TcollectionView.register(UINib.init(nibName: "TCell", bundle: nil), forCellWithReuseIdentifier: "TCell")
            TcollectionView.delegate = self
            TcollectionView.dataSource = self
        }
    }
    
    
    @IBOutlet var FOcollectionView: UICollectionView!{
        didSet{
            FOcollectionView.register(UINib.init(nibName: "FoCell", bundle: nil), forCellWithReuseIdentifier: "FoCell")
            FOcollectionView.delegate = self
            FOcollectionView.dataSource = self
        }
    }
    @IBOutlet var FIcollectionView: UICollectionView!{
        didSet{
            FIcollectionView.register(UINib.init(nibName: "FiCell", bundle: nil), forCellWithReuseIdentifier: "FiCell")
            FIcollectionView.delegate = self
            FIcollectionView.dataSource = self
        }
    }
    
    var Fimgs = ["1", "2", "3", "4", "5", "6"]
    var Simgs = ["7", "8", "9", "10"]
    var Timgs = ["11", "12", "13", "14"]
    var Fitext = ["Pop", "Hip-Hop", "Jazz", "Electronic", "Folk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


extension ExploreTab: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case FcollectionView:
            return Fimgs.count
        case ScollectionView:
            return Simgs.count
        case TcollectionView:
            return Timgs.count
        case FOcollectionView:
            return 5
        case FIcollectionView:
            return Fitext.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == FcollectionView{
            let Fcell = collectionView.dequeueReusableCell(withReuseIdentifier: "FCell", for: indexPath) as! FCell
            Fcell.imgView.image = UIImage(named: Fimgs[indexPath.row])
            return Fcell
        }
        if collectionView == ScollectionView{
            let Scell = collectionView.dequeueReusableCell(withReuseIdentifier: "SCell", for: indexPath) as! SCell
            Scell.imgView.image = UIImage(named: Simgs[indexPath.row])
            return Scell
        }
        if collectionView == TcollectionView{
            let Tcell = collectionView.dequeueReusableCell(withReuseIdentifier: "TCell", for: indexPath) as! TCell
            Tcell.imgView.image = UIImage(named: Timgs[indexPath.row])
            return Tcell
        }
        if collectionView == FOcollectionView {
            let FoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoCell", for: indexPath) as! FoCell
            FoCell.imgView.image = UIImage(named: "rivitz")
            return FoCell
        }
        if collectionView == FIcollectionView {
            let FiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FiCell", for: indexPath) as! FiCell
            FiCell.button.setTitle(Fitext[indexPath.row], for: .normal) 
            return FiCell
        }
        else{return UICollectionViewCell(frame: CGRect())}
    }
    
    
}
