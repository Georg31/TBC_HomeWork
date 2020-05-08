//
//  ViewController.swift
//  HomeWork_18
//
//  Created by George Digmelashvili on 5/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Table: UITableView!
    var Notes = [URL]()
    var selectedNote: URL?
    var EditNote: URL?
        
   
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       let customManager = CustomFileManager.defaultManager()
        Notes = customManager.getNotes()
        Table.delegate = self
        Table.dataSource = self
    }


}



extension ViewController: UITableViewDelegate, UITableViewDataSource , Update{
   
    func update() {
           
        let customManager = CustomFileManager.defaultManager()
        Notes = customManager.getNotes()
        self.Table.reloadData()
          
    }
          
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = self.Notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note_Cell", for: indexPath) as! NoteCell
        let notename = note.absoluteURL.deletingPathExtension()
        cell.NameLabel.text = notename.lastPathComponent
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNote = Notes[indexPath.row]
        performSegue(withIdentifier: "Show_Note", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            let customManager = CustomFileManager.defaultManager()
            customManager.delete(at: self.Notes[indexPath.row])
            self.Notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            handler(true)
        }
        
       let edit = UIContextualAction(style: .normal, title: "Edit") { (actiib, view, handler) in
        self.EditNote = self.Notes[indexPath.row]
        self.performSegue(withIdentifier: "Edit_Note", sender: nil)
        }
        edit.backgroundColor = .systemIndigo
         
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        
        return config
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let id = segue.identifier, id == "Add_Note" {
                
                if let notes = segue.destination as? AddNoteController {
                    notes.delegate = self
                }
        }
        
        if let id = segue.identifier, id == "Show_Note" {
            if let note = segue.destination as? ViewNoteController{
                note.header = selectedNote?.absoluteURL.deletingPathExtension().lastPathComponent
                let customManager = CustomFileManager.defaultManager()
                let body = customManager.readText(url: selectedNote!)
                note.body = body
            }
        }
        
        if let id = segue.identifier, id == "Edit_Note"{
            if let note = segue.destination as? EditNoteController{
                let customManager = CustomFileManager.defaultManager()
                let body = customManager.readText(url: EditNote!)
                note.delegate = self
                note.selectedNote = EditNote
                note.body = body
                note.header = EditNote?.absoluteURL.deletingPathExtension().lastPathComponent
            }
        }
        
    }
    
   
}

