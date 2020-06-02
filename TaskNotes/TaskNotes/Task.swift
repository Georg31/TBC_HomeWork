//
//  Task.swift
//  TaskNotes
//
//  Created by George Digmelashvili on 6/2/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation


class Task{
    var text: String
    var date: Date
    
    init(text: String, date: Date) {
        self.text = text
        self.date = date
    }
}
