//
//  ViewController.swift
//  weatherApp-44
//
//  Created by George Digmelashvili on 6/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var vm: VM?
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var tempLalel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cloudLabel: UILabel!
    @IBOutlet var maxLabel: UILabel!
    @IBOutlet var minLabel: UILabel!
    @IBOutlet var detailButton: UIButton!
    
    
    let locationManager = CLLocationManager()
    var lat: Double!
    var lon: Double!
    var weather: WeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkLocationServiceEnabled()
        
    }
    
    
    @IBAction func LocationButton(_ sender: UIButton) {
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DeatiledSegue"{
            let seg = segue.destination as! DetailedWeather
            seg.weather = self.weather
        }
    }
    
    
    
    
    func setData(){
        
        DispatchQueue.main.async {
            self.weather?.current.weather.first?.icon.rawValue.downloadImage{(img) in
                DispatchQueue.main.async {self.imgView.image = img}}
            self.tempLalel.text = self.vm?.temp
            self.cityLabel.text = self.vm?.city
            self.cloudLabel.text = self.vm?.cloud
            self.maxLabel.text = self.vm?.max
            self.minLabel.text = self.vm?.min
            self.detailButton.isEnabled = true
        }
        
    }
    
    
    
    
}
