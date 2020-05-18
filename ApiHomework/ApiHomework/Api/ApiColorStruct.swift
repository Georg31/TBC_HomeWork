//
//  ApiService.swift
//  ApiHomework
//
//  Created by George Digmelashvili on 5/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation
import UIKit



struct ColorResponse: Codable {
    
    let colors: [Colors]
    
    
    enum CodingKeys: String, CodingKey {
        case colors = "data"
    }
}

struct Colors: Codable {
    let id: Int
    let name: String
    let year: Int
    let color: String
    let pantoneValue: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case year
        case color
        case pantoneValue = "pantone_value"
    }
    
    
}


