//
//  StoryCells.swift
//  Lecture49
//
//  Created by George Digmelashvili on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class StoryCells: UICollectionViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imgView: UIImageView! {
       
        didSet{
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.layer.cornerRadius = 25
            imgView.contentMode = .scaleAspectFill
            imgView.clipsToBounds = true
        }
    }
}
