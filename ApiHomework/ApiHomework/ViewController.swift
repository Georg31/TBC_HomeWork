//
//  ViewController.swift
//  ApiHomework
//
//  Created by George Digmelashvili on 5/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var bgColor = UIColor()
    var Apicolors = [Colors]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        getColors()
    }
    
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func getColors() {
        let url = URL(string: "https://reqres.in/api/unknown")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let col = try decoder.decode(ColorResponse.self, from: data)
                
                self.Apicolors.append(contentsOf: col.colors)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {print(error.localizedDescription)}
            
        }.resume()
    }
    
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Apicolors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collor_Cell", for: indexPath) as! ColorCell
        let color = hexStringToUIColor(hex: Apicolors[indexPath.row].color)
        cell.backgroundColor = color
        cell.colorCode.text = Apicolors[indexPath.row].color
        cell.nameLabel.text = Apicolors[indexPath.row].name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bgColor = hexStringToUIColor(hex: Apicolors[indexPath.row].color)
        performSegue(withIdentifier: "Chuck_Norris", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWith = collectionView.frame.width / 2
        
        return CGSize(width: itemWith - 5, height: 150)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "Chuck_Norris"{
            
            if let chuckVC = segue.destination as? ChuckController{
                chuckVC.color = bgColor
            }
        }
    }
}
