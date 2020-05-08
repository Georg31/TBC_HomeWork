//
//  SaveNoteFiles.swift
//  HomeWork_18
//
//  Created by George Digmelashvili on 5/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import Foundation

class CustomFileManager {
    let fm = FileManager.default
    
    private static let customManager = CustomFileManager()
    
    private init() {
        
    }
    
    var superPath: URL {
        return try! fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    var NotePath: URL{ return superPath.appendingPathComponent("Notes")}
    
    static func defaultManager() -> CustomFileManager {
        return customManager
    }
    
    func NoteFolder() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("Notes")
        if !FileManager.default.fileExists(atPath: dataPath.absoluteString) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription);
            }
        }
        
    }
    
    
    func createNote(name: String, text: String) {
        NoteFolder()
        let note = NotePath.appendingPathComponent("\(name).txt")
        do {
            try text.write(to: note, atomically: true, encoding: .utf8)
            
        } catch {}
        
    }
    
    
    func checkIfExists(name: String) -> Bool{
        do {
            let Files = try fm.contentsOfDirectory(at: NotePath, includingPropertiesForKeys: nil, options: [])
            for i in Files{
                if i.lastPathComponent == name + ".txt"{
                    return true
                }
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return false
        
    }
    
    
    
    func getNotes() -> [URL] {
        var Files = [URL]()
        do {
            Files = try fm.contentsOfDirectory(at: NotePath, includingPropertiesForKeys: nil, options: [])
        }
            
        catch {
            print(error.localizedDescription)
        }
        return Files
    }
    
    
    func delete(at url: URL) {
        do {
            try fm.removeItem(at: url)
        } catch {
            
        }
    }
    
    func Edit(url: URL, text: String)
    {
        do{
            try text.write(to: url, atomically: true, encoding: .utf8)
        }
        catch{}
    }
    
    func readText(url: URL) -> String {
        return try! String(contentsOf: url)
    }
    
   
}
