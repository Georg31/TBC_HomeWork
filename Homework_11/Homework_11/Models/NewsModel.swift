//
//  NewsModel.swift
//  Homework_11
//
//  Created by George Digmelashvili on 4/30/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation

class News{
    var title : String
    var body : String
    var imageUrl = String()
    
    init(_ title: String, _ body: String) {
        self.title = title
        self.body = body
    }
}
