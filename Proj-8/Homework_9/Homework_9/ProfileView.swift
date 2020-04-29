//
//  ProfileView.swift
//  Homework_9
//
//  Created by George Digmelashvili on 4/27/20.
//  Copyright © 2020 TBC BootCamp. All rights reserved.
//

import UIKit

class ProfileView: UIViewController {
    
    @IBOutlet weak var NLabel: UILabel!
    @IBOutlet weak var LLabel: UILabel!
    @IBOutlet weak var ELabel: UILabel!
    @IBOutlet weak var PLabel: UILabel!
    var name, lastname, email, phone : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NLabel.text! += name!
        LLabel.text! += lastname!
        ELabel.text! += email!
        PLabel.text! += phone!
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
