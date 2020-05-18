//
//  ChuckController.swift
//  ApiHomework
//
//  Created by George Digmelashvili on 5/18/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ChuckController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var jokeLabel: UILabel!
    
    
    var joke = [ChuckJoke]()
    var color = UIColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = color
        getJokes()
        
    }
    
    
    @IBAction func refreshButton(_ sender: UIButton) {
        getJokes()
    }
    
    
    
    func assignData(_ img: UIImage){
        catLabel.text = joke.last?.categories.first
        dateLabel.text = joke.last?.createdAt
        jokeLabel.text = joke.last?.value
        imageView.image = img
    }
    
    func getJokes() {
        let url = URL(string: "https://api.chucknorris.io/jokes/random")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            let data = data!
            
            do {
                let decoder = JSONDecoder()
                let joke = try decoder.decode(ChuckJoke.self, from: data)
                
                self.joke.append(joke)
                self.joke.last?.iconURL.downloadImage{ (image) in
                    DispatchQueue.main.async {
                        self.assignData(image!)
                    }
                }
                
            } catch {print(error)}
            
        }.resume()
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
