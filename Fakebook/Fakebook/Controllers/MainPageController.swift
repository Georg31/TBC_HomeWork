//
//  ProfileController.swift
//  Fakebook
//
//  Created by George Digmelashvili on 5/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class MainPageController: UIViewController {
   
    @IBOutlet weak var TableView: UITableView!
    
    var posts = [PostDB()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       // self.tabBarController!.navigationItem.hidesBackButton = true
        TableView.rowHeight = UITableView.automaticDimension
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
        posts = Dbase.getPosts()
        TableView.reloadData()
    }
    
}


extension MainPageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Post_Cell", for: indexPath) as! PostCell
               
        cell.userImage.image = UIImage(data: (posts[indexPath.row].userRelation?.profileImage!)!)
        cell.postLabel.text = posts[indexPath.row].postText
        cell.nameLabel.text = posts[indexPath.row].userRelation!.name! + " " +
            posts[indexPath.row].userRelation!.lastname!
               
               return cell
    }
    
   
}
