//
//  SongListCell.swift
//  MusicApp
//
//  Created by George Digmelashvili on 5/19/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class SongListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
