//
//  UserModel.swift
//  Homework_10
//
//  Created by George Digmelashvili on 4/29/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation


class User{
    var name = String()
    var lname = String()
    var email = String()
    var gender = String()
    
    init(_ name: String, _ lname: String, _ email: String, _ gender: Int) {
        self.name = name
        self.email = email
        self.lname = lname
        self.gender = gen(x: gender)
    }
    func gen(x: Int) -> String {
        if x == 0{return "Male"}
            return "Female"
    }
}
