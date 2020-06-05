//
//  Api.swift
//  Homework35_Shimmer
//
//  Created by George Digmelashvili on 6/5/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation

struct Bands: Codable {
    let bands: [BandApi]
    
    
}

struct BandApi: Codable {
    let name: String
    let imgURL: String
    let thumb1: String
    let thumb2: String
    let thumb3: String
    let info: String
    let genre: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imgURL = "img_url"
        case thumb1, thumb2, thumb3, info, genre
    }
}

class ApiService{
    
    static func getBands(completion: @escaping ([BandApi])->()){
        let url = URL(string: "http://www.mocky.io/v2/5ec3e47a300000e4b039c515")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else{return}
            do{
                let decoder = JSONDecoder()
                let band = try decoder.decode(Bands.self, from: data)
                completion(band.bands)
            }catch{print(error)}
        }.resume()
    }
    
    static func AllCoins(completion: @escaping ([RawUsd]) -> ()) {
        guard let url = URL(string: "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=100&tsym=USD&api_key=37cf47888c6fc236664056ca1f0c6dbcf16a70ff6855a30d55c1ceff337cb0b8p") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let coins = try decoder.decode(Welcome.self, from: data)
                let s = coins.data.map({$0.raw.usd})
                
                completion(s)
            } catch {print(error)}
            
        }.resume()
    }
    
}

struct Welcome: Codable {
    
    
    let data: [Datum]
    
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let raw: Raw
    
    enum CodingKeys: String, CodingKey {
        case raw = "RAW"
    }
}




// MARK: - Raw
struct Raw: Codable {
    let usd: RawUsd
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - RawUsd
struct RawUsd: Codable {
    
    let fromsymbol: String
    let price: Double
    let imageurl: String
    
    enum CodingKeys: String, CodingKey {
        
        case fromsymbol = "FROMSYMBOL"
        
        case price = "PRICE"
        case imageurl = "IMAGEURL"
    }
}
