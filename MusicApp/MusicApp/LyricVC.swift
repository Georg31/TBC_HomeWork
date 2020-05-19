//
//  LyricVC.swift
//  MusicApp
//
//  Created by George Digmelashvili on 5/19/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit


struct Lyric: Codable {
    let lyrics: String
}

class LyricVC: UIViewController {
    
    @IBOutlet weak var lyricText: UITextView!
    
    var song: Song?
    var band: BandApi?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = song?.title
        getLyrics()
    }
    
    
    
    
    func getLyrics(){
        let artist = band?.name ?? ""
        let title = song?.title ?? ""
        let s = "https://api.lyrics.ovh/v1/\(artist)/\(title)"
        let s1 = s.replacingOccurrences(of: " ", with: "%20")
        // aman mawvala url abrunebda misamarts da boloshi nil ecera rato ver gavige
        // debugidan ro vbechdavdi exeptions isvroda romelzec veraperi ver vnaxe
        // bolos gascorda mara rogor gavascore egec ver gavige :)
        guard let url = URL(string: s1) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let unwrapedData = data else {return}
            do {
                let decoder = JSONDecoder()
                let lyric = try decoder.decode(Lyric.self, from: unwrapedData)
                DispatchQueue.main.async {
                    self.lyricText.text = lyric.lyrics
                }
            } catch {print(error)}
        }.resume()
    }
}
