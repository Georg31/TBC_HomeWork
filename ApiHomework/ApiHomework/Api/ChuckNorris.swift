//
//  ChuckNorris.swift
//  ApiHomework
//
//  Created by George Digmelashvili on 5/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation


struct ChuckJoke: Codable {
    
    let categories  : [String]
    let createdAt   : String
    let iconURL     : String
    let id          : String
    let updatedAt   : String
    let url         : String
    let value       : String
    
    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL   = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url
        case value
    }
    
}
