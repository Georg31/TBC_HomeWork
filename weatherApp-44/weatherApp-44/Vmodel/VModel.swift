//
//  VModel.swift
//  weatherApp-44
//
//  Created by George Digmelashvili on 6/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation

struct VM{
    let city: String
    let temp: String
    let cloud: String
    let min: String
    let max: String
    
    init(weather: WeatherData) {
        city = weather.timezone.components(separatedBy: "/").last!
        temp = "\(Int(weather.current.temp))"
        cloud = weather.current.weather.first!.weatherDescription.rawValue
        min = String(weather.daily.first!.temp.min)
        max = String(weather.daily.first!.temp.max)
    }
}
