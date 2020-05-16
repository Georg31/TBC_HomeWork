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
    
    static func regUser(_ uname: String, _ name: String, _ lastname: String, _ email: String, _ password: String, data: Data) {
        let context = AppDelegate.coreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "UserDB", in: context)
        let user = UserDB(entity: entityDescription!, insertInto: context)
        
        user.profileImage = data
        user.name = name
        user.lastname = lastname
        user.username = uname
        user.email = email
        user.password = password
        do {
            try context.save()
        } catch {}
    }
    
    static func signIn(_ username: String, _ password: String) -> (UserDB, Bool){
        let context = AppDelegate.coreDataContainer.viewContext
        var users = [UserDB]()
        var user = UserDB()
        var check = false
        let request: NSFetchRequest<UserDB> = UserDB.fetchRequest()
        
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
    
    
    static func creatPost(_ body: String, _ user: UserDB) {
        let context = AppDelegate.coreDataContainer.viewContext
        let notEntityDescription = NSEntityDescription.entity(forEntityName: "PostDB", in: context)
        let post = PostDB(entity: notEntityDescription!, insertInto: context)
        post.postText = body
        post.postDate = Date()
        user.addToPostRelation(post)
        do {
            try context.save()
            
        } catch {}
    }
    
    
    static func getPostsByUser(_ user: UserDB) -> [PostDB]{
        var notes = [PostDB]()
        let note = user.postRelation as! Set<PostDB>
        notes.append(contentsOf: note)
        return notes
    }
    
    static func getPosts() -> [PostDB]{
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<PostDB> = PostDB.fetchRequest()
        var posts = [PostDB]()
        do {
            let result = try context.fetch(request)
            
            posts = result
            
        } catch {}
        return posts
    }
    
    
    static func updateUser(_ user: UserDB, _ name: String, _ lastname: String, _ email: String, _ password: String, _ data: Data){
        let context = AppDelegate.coreDataContainer.viewContext
        user.name = name
        user.lastname = lastname
        user.email = email
        user.password = password
        user.profileImage = data
        do {
            try context.save()
        } catch{}
    }
    
    /*
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
     */
}
