//
//  BandCell.swift
//  Homework35_Shimmer
//
//  Created by George Digmelashvili on 6/5/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
import ShimmerSwift
class BandCell: UITableViewCell {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //if imgView.image != nil{self.stopShimmering(); imgView.backgroundColor = nil; self.layoutIfNeeded()}
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
