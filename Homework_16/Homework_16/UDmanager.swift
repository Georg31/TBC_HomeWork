//
//  UDmanager.swift
//  Homework_16
//
//  Created by George Digmelashvili on 5/6/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation

class UDManager {
    
    internal static let col = "KEY_FIRST_NAME"
    internal let KEY_LAST_NAME  = "KEY_LAST_NAME"
    
    internal static let LogedIN = "Loged IN"
 
    static func getUD() -> UserDefaults {
        return UserDefaults.standard
    }
    
    // save first name
    static func RegUser(value: String, key: String) {
        getUD().set(value, forKey: key)
    }
    
    static func SaveColor(value: Int){
        getUD().set(value, forKey: "color")
    }
    
    static func getColor() -> Int{
        return getUD().integer(forKey: "color")
    }
    
    // get first name
    static func GetUser(user: String) -> String {
        return getUD().string(forKey: user) ?? ""
    }
    
    
    static func LogIn() {
        getUD().set(true, forKey: LogedIN)
    }
    
    static func LogOut() {
        getUD().set(false, forKey: LogedIN)
    }
    
    static func isLogedIn() -> Bool {
        return getUD().bool(forKey: LogedIN)
    }
    
    static func exists(key: String) -> Bool{
        if GetUser(user: key) == ""{return false}
        return true
    }
}

