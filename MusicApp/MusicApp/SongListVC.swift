//
//  SongListVC.swift
//  MusicApp
//
//  Created by George Digmelashvili on 5/19/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

struct Base: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let band: String
    let songs: [Song]
}

struct Song: Codable {
    let title: String
}

class SongListVC: UIViewController {
    @IBOutlet weak var aboutBandTextV: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    var band: BandApi?
    var songs = [Song]()
    var song: Song?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = band?.name
        aboutBandTextV.text = band?.info
        getSongs()
    }
    
    
    
    
    func getSongs(){
        let url = URL(string: "http://www.mocky.io/v2/5ec3ca1c300000e5b039c407")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else{return}
            do{
                let decoder = JSONDecoder()
                let song = try decoder.decode(Base.self, from: data)
                for i in song.data{
                    if i.band == self.band?.name{ self.songs.append(contentsOf: i.songs)}
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{print(error)}
        }.resume()
    }
}


extension SongListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongList_Cell", for: indexPath) as! SongListCell
        cell.titleLabel.text = songs[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        song = songs[indexPath.row]
        performSegue(withIdentifier: "Lyrics_segue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "Lyrics_segue"{
            
            if let newVC = segue.destination as? LyricVC{
                newVC.song = self.song
                newVC.band = self.band
            }
        }
    }
}
