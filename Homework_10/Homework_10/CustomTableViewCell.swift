//
//  CustomTableViewCell.swift
//  Homework_10
//
//  Created by George Digmelashvili on 4/29/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var FullNameLabel: UILabel!
    @IBOutlet weak var GenderLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    func set(user: User){
            FullNameLabel.text! += user.name + " " + user.lname
        GenderLabel.text! += "\(user.gender.first ??  "F")"
        
    }
}
