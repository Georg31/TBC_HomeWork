//
//  weatherCell.swift
//  weatherApp-44
//
//  Created by George Digmelashvili on 6/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell {

    @IBOutlet var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
