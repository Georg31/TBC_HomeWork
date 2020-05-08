//
//  ViewNoteController.swift
//  HomeWork_18
//
//  Created by George Digmelashvili on 5/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewNoteController: UIViewController {

    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var BodyLabel: UITextView!
    
    var header: String?
    var body: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        HeaderLabel.text = header
        BodyLabel.text = body
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
