//
//  Contacts.swift
//  HomeWork_17
//
//  Created by George Digmelashvili on 5/7/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation


class Contact {
    var phone = String()
    var country = String()
    var date = String()
    
    init(phone: String, country: String) {
        self.phone = phone
        self.country = country
        let d = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: d)
        let minutes = calendar.component(.minute, from: d)
        self.date = String(hour) + ":" + String(minutes)
    }
    
}

