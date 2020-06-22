//
//  ListCell.swift
//  Lecture46
//
//  Created by George Digmelashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
