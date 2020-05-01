//
//  CarListCell.swift
//  Homework_12
//
//  Created by George Digmelashvili on 5/1/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class CarListCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ModelLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
