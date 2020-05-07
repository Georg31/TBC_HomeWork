//
//  Chats.swift
//  HomeWork_17
//
//  Created by George Digmelashvili on 5/7/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation
import UIKit

class Chat{
    var name = String()
    var text = String()
    var image = UIImage()
    
    init(name: String, text: String, image: String) {
        self.name = name
        self.text += text
        self.image = UIImage(named: image)!
    }
}
