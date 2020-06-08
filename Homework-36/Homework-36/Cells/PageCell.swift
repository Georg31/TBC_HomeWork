//
//  PageCell.swift
//  Homework-36
//
//  Created by George Digmelashvili on 6/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
     func bind(page: Page) {
           imgView.image = page.image
           titleLabel.text = page.title
           textLabel.text = page.text
       }
}
