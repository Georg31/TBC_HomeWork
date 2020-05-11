//
//  FileList.swift
//  FolderManager
//
//  Created by George Digmelashvili on 5/11/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class FileList: UIViewController, updateFiles {

    @IBOutlet weak var Table: UITableView!
    var  selected: URL?
    var fileEdit: URL?
    var InSelectedFolder = [URL]()
    var check = false
    var look = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Table.delegate = self
        Table.dataSource = self
        files()
    }
    

    func files(){
        let fm = CustomFileManager.defaultManager()
        InSelectedFolder = fm.getFiles(url: selected!)
    }
    func update(){
        files()
        Table.reloadData()
    }
    func editDone(){
        check = false
        look = false
        update()
    }

}



extension FileList: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InSelectedFolder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "File_Cell", for: indexPath) as! FileCell
        
        cell.NameLAbel.text = InSelectedFolder[indexPath.row].lastPathComponent
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        look = true
        fileEdit = InSelectedFolder[indexPath.row]
        performSegue(withIdentifier: "AddTXT", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           
           let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
               let customManager = CustomFileManager.defaultManager()
               customManager.delete(at: self.InSelectedFolder[indexPath.row])
               self.InSelectedFolder.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .left)
               
               handler(true)
           }
           
          let edit = UIContextualAction(style: .normal, title: "Edit") { (actiib, view, handler) in
            self.fileEdit = self.InSelectedFolder[indexPath.row]
            self.check = true
            self.performSegue(withIdentifier: "AddTXT", sender: nil)
           }
           edit.backgroundColor = .systemIndigo
            
           let config = UISwipeActionsConfiguration(actions: [delete, edit])
           
           return config
       }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "AddTXT" {
            
            if let newFile = segue.destination as? AddFile {
                newFile.check = self.check
                newFile.look = self.look
                newFile.url = self.selected
                newFile.fileEdit = self.fileEdit
                newFile.del = self
            }
        }
    }
    
}
