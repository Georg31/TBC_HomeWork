//
//  FoodCell.swift
//  AnimationHomework28
//
//  Created by George Digmelashvili on 5/27/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


