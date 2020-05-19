//
//  ViewController.swift
//  MusicApp
//
//  Created by George Digmelashvili on 5/19/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

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


class MainVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   var bands = [BandApi]()
    var selected: BandApi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        getBands()
    }


    
    
    
    
    func getBands(){
        let url = URL(string: "http://www.mocky.io/v2/5ec3e47a300000e4b039c515")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
        
            guard let data = data else{return}
            do{
                let decoder = JSONDecoder()
                let band = try decoder.decode(Bands.self, from: data)
                self.bands.append(contentsOf: band.bands)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }catch{print(error)}
        }.resume()
    }

}








extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Band_Cell", for: indexPath) as! BandCell
        cell.nameLable.text = bands[indexPath.row].name
        bands[indexPath.row].imgURL.downloadImage{(img) in
            DispatchQueue.main.async {
                cell.imageV.image = img
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selected = bands[indexPath.row]
        performSegue(withIdentifier: "SongListVC", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWith = collectionView.frame.width / 2
        
        return CGSize(width: itemWith - 5, height: 230)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "SongListVC"{
            
            if let newVC = segue.destination as? SongListVC{
                newVC.band = selected
            }
        }
    }
    
}

extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}
