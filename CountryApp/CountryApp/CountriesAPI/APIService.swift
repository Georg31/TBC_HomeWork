//
//  APIService.swift
//  CountryApp
//
//  Created by George Digmelashvili on 5/20/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation


import Foundation

class APIService {
    
    //typealias completion = ([Countries]) -> ()
    
    func AllCountries(completion: @escaping ([Countries]) -> ()) {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Countries].self, from: data)
                
                completion(countries)
            } catch {print(error)}
            
        }.resume()
    }
    
    func SearchCountries(name: String, completion: @escaping ([Countries]) -> ()) {
        let url = [URL(string: "https://restcountries.eu/rest/v2/name/\(name)"), URL(string: "https://restcountries.eu/rest/v2/capital/\(name)")]
        for i in url
        {URLSession.shared.dataTask(with: i!) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Countries].self, from: data)
                if countries.isEmpty{}
                completion(countries)
            } catch {}
            
        }.resume()}
    }
}
