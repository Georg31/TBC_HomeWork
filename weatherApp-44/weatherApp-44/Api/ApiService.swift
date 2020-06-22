//
//  ApiService.swift
//  weatherApp-44
//
//  Created by George Digmelashvili on 6/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation

class APIService {
    
    static func weather(lat: Double, lon: Double, completion: @escaping (WeatherData) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&%20exclude=hourly,daily&appid=559b4f4252e8af108bcc2f931570c33f&units=Metric") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherData.self, from: data)
                completion(weather)
            } catch {print(error)}
            
        }.resume()
    }
    
}
