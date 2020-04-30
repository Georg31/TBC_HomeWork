//
//  ReadNews.swift
//  Homework_11
//
//  Created by George Digmelashvili on 4/30/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ReadNews: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var body: String?
    var Title: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bodyLabel.text = body
        titleLabel.text = Title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
