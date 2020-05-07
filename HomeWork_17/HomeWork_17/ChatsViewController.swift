//
//  ChatsViewController.swift
//  HomeWork_17
//
//  Created by George Digmelashvili on 5/7/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    

    @IBOutlet weak var Table: UITableView!
    
    var chats = [Chat(name: "giorgi", text: "some massege", image: "f1")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Table.delegate = self
        Table.dataSource = self
    }
    

    @IBAction func NewMassegeButton(_ sender: UIBarButtonItem) {
      //performSegue(withIdentifier: "NewMassege", sender: nil)
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
           let newsVC = storyBoard.instantiateViewController(withIdentifier: "NewMassege")
                    if let unwrappedVC = newsVC as? NewMassegeViewController{
                        unwrappedVC.del = self
                    }
               self.navigationController?.pushViewController(newsVC, animated: true)
    }
    

}


extension ChatsViewController: UITableViewDataSource, UITableViewDelegate, msg{
    func send(chat: Chat) {
        chats.append(chat)
       
    }
    
    func reload(){
        Table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = self.chats[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Chat_Cell", for: indexPath) as! ChatsCell
        cell.NameLabel.text = user.name
        cell.TextLabel.text = user.text
        cell.img.image = user.image
        
        return cell
    }
    
}
