//
//  DetailedWeather.swift
//  weatherApp-44
//
//  Created by George Digmelashvili on 6/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class DetailedWeather: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var weather: WeatherData!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
    
}

extension DetailedWeather: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! weatherCell
        cell.tempLabel.text = "\(weather.daily[indexPath.section].temp.day) °C"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        weather.daily.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dt =  Date(timeIntervalSince1970: TimeInterval(weather.daily[section].dt))
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        let date = dateformat.string(from: dt)
        return "Date: \(date)"
    }
    
}
