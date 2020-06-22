//
//  LocationService.swift
//  weatherApp-44
//
//  Created by George Digmelashvili on 6/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

extension ViewController: CLLocationManagerDelegate{
    
    //let locationManager = CLLocationManager()
    
    
    func checkLocationServiceEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkAuthorizationStatus()
        } else {
            
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            break
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        locationManager.stopUpdatingLocation()
        let coordinate = location.coordinate
        
        lat = coordinate.latitude
        lon = coordinate.longitude
        
        APIService.weather(lat: self.lat, lon: self.lon) { (Weather) in
            DispatchQueue.main.async {
                self.weather = Weather
                self.vm = VM(weather: Weather)
                self.setData()
            }
            
        }
    }
    
    
}



extension String{
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: "http://openweathermap.org/img/wn/\(self)@2x.png") else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
}
