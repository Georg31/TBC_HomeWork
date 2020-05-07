//
//  ChatsCell.swift
//  HomeWork_17
//
//  Created by George Digmelashvili on 5/7/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ChatsCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       img.layer.borderWidth = 1.0
       img.layer.masksToBounds = false
       img.layer.borderColor = UIColor.white.cgColor
       img.layer.cornerRadius = img.frame.size.width / 2
       img.clipsToBounds = true
    }

}
