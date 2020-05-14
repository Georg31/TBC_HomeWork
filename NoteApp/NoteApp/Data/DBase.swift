//
//  DBase.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/14/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation
import CoreData

class Dbase: NSManagedObject{
    
    static func regUser(_ uname: String, _ email: String, _ password: String) {
        let context = AppDelegate.coreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "NoteUsers", in: context)
        let user = NoteUsers(entity: entityDescription!, insertInto: context)
        
        user.username = uname
        user.email = email
        user.password = password
        do {
            try context.save()
        } catch {}
    }
    
    static func signIn(_ username: String, _ password: String) -> (NoteUsers, Bool){
        let context = AppDelegate.coreDataContainer.viewContext
        var users = [NoteUsers]()
        var user = NoteUsers()
        var check = false
        let request: NSFetchRequest<NoteUsers> = NoteUsers.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            
            users = result
            
        } catch {}
        for u in users{
            if u.username == username && u.password == password{
                user = u
                check = true
            }
        }
        let tup = (user, check)
        
        return tup
    }
    
    
    static func createNote(_ name: String, _ body: String, _ user: NoteUsers) {
        let context = AppDelegate.coreDataContainer.viewContext
        let notEntityDescription = NSEntityDescription.entity(forEntityName: "Notes", in: context)
        let note = Notes(entity: notEntityDescription!, insertInto: context)
        note.name = name
        note.notebody = body
        user.addToNoteRelation(note)
        
        do {
            try context.save()
            
        } catch {}
    }
    
    
    static func getNotes(_ user: NoteUsers) -> [Notes]{
        var notes = [Notes]()
        let note = user.noteRelation as! Set<Notes>
        notes.append(contentsOf: note)
        
        return notes
    }
    
    static func deleteNote(_ note: Notes) {
        let context = AppDelegate.coreDataContainer.viewContext
        
        context.delete(note)
        
        do {
            try context.save()
        } catch {}
    }
    
    static func editNote(_ note: Notes,_ text: String) {
        let context = AppDelegate.coreDataContainer.viewContext
        note.notebody = text
        do {
            try context.save()
        } catch {}
    }
    
}
