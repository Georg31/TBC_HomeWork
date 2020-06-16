//
//  CellVM.swift
//  CustomTabBar-41
//
//  Created by George Digmelashvili on 6/16/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation
import UIKit

struct CellVM {
    var name: String
    var image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: name)!
    }
}
