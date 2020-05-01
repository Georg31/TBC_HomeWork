//
//  Cars.swift
//  Homework_12
//
//  Created by George Digmelashvili on 5/1/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//
import UIKit

import Foundation

class Car{
    var img: String
    var model: String
    var price: Int
    
    init(_ img: String, _ model: String, _ price: Int) {
        self.img = img
        self.model = model
        self.price = price
    }
}
