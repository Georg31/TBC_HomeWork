//
//  TaskCell.swift
//  TaskNotes
//
//  Created by George Digmelashvili on 6/2/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet var textField: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
