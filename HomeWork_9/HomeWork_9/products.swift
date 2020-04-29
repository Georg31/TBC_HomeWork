//
//  products.swift
//  HomeWork_9
//
//  Created by George Digmelashvili on 4/28/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation

class products{
    
    var name: String?
    var type: String?
    var weight, price: Double?
    
    init(_ name: String, _ type: String, _ weight: Double, _ price: Double) {
        self.name = name
        self.type = type
        self.weight = weight
        self.price = price
    }
}
