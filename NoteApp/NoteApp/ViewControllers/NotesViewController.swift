//
//  NotesViewController.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/14/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user = NoteUsers()
    var OnEdit = false
    var look = false
    var editNote = Notes()
    var notes = [Notes]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        get()
       // navigationItem.backBarButtonItem!.title = "Sign Out"
    }
    
    
    func get(){
        notes = Dbase.getNotes(user)
    }
    
}


extension NotesViewController: UITableViewDelegate, UITableViewDataSource, refreshService{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note_Cell", for: indexPath) as! NoteCell
        cell.NameLabel.text = notes[indexPath.row].name
        cell.ShortTextLabel.text = notes[indexPath.row].notebody
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (a, v, handler) in
            Dbase.deleteNote(self.notes[indexPath.row])
            
            self.notes.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (a, v, handler) in
            self.editNote = self.notes[indexPath.row]
            self.OnEdit = true
            self.performSegue(withIdentifier: "AddNotes_Segue", sender: nil)
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.look = true
        editNote = notes[indexPath.row]
        performSegue(withIdentifier: "AddNotes_Segue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "AddNotes_Segue"{
            if let newnoteVc = segue.destination as? CreateNoteController {
                newnoteVc.user = self.user
                newnoteVc.editNote = self.editNote
                newnoteVc.OnEdit = self.OnEdit
                newnoteVc.del = self
                newnoteVc.look = self.look
            }
        }
    }
    
    func update() {
        get()
        tableView.reloadData()
    }
    
    func editDone(){
        OnEdit = false
    }
    
    func saw(){
        look = false
    }
}
