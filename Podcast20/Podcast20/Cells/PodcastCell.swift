//
//  PodcastCell.swift
//  Podcast20
//
//  Created by George Digmelashvili on 5/13/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class PodcastCell: UITableViewCell {

    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var AboutLabel: UILabel!
    @IBOutlet weak var DurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
