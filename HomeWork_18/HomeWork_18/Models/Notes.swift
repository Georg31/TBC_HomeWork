//
//  Notes.swift
//  HomeWork_18
//
//  Created by George Digmelashvili on 5/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation


class Note {
    var text = String()
    var date = String()
    
    init(text: String) {
        self.text = text
        let d = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: d)
        let month = calendar.component(.month, from: d)
        let year = calendar.component(.year, from: d)
        self.date = String(day) + "/" + String(month) + "/" + String(year)
    }
}
