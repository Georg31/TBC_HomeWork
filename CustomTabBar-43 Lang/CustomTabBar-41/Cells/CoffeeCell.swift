//
//  CoffeeCell.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class CoffeeCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    var cellVm: CellVM!{
        didSet{
            nameLabel.text = cellVm.name
            imgView.image = cellVm.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
}
