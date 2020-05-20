//
//  ViewController.swift
//  CountryApp
//
//  Created by George Digmelashvili on 5/20/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var countries = [Countries]()
    var country: Countries?
    let api = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        api.AllCountries{(getCountries) in
            self.countries = getCountries
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    @IBAction func test(_ sender: Any) {
        let s = countries[0].borders
        print(s.count)
        print(s)
        
    }
    
}



extension MainVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country_Cell", for: indexPath) as! CountryCell
        cell.countryLabel.text = countries[indexPath.row].name
        cell.capitalLabel.text = countries[indexPath.row].capital
        cell.currencyLabel.text = countries[indexPath.row].currencies.first?.symbol
        var borders = String()
        for border in countries[indexPath.row].borders{
            borders += border + ","
        }
        if borders.count > 0 {borders.removeLast(1)}
        cell.borderLabel.text = borders
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.country = countries[indexPath.row]
        performSegue(withIdentifier: "Country_Detail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "Country_Detail"{
            if let newVC = segue.destination as? DetailController{
                newVC.country = self.country
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            api.AllCountries{(getCountries) in
                self.countries = getCountries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        if searchText.count > 3{
            DispatchQueue.main.async {
                self.api.SearchCountries(name: searchText) { (getCountries) in
                    self.countries = getCountries
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
