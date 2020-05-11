//
//  ViewController.swift
//  FolderManager
//
//  Created by George Digmelashvili on 5/11/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class MainController: UIViewController {

   
    @IBOutlet weak var FolderCV: UICollectionView!
    var Folders = [URL]()
    var selected: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FolderCV.delegate = self
        FolderCV.dataSource = self
        FoldersURL()
    }


    func FoldersURL(){
        let fm = CustomFileManager.defaultManager()
        Folders = fm.GetFolders()
    }
    func update() {
           FoldersURL()
           self.FolderCV.reloadData()
       }
}




extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UpdateCells{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Folders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Folder_Cell", for: indexPath) as! FolderCell
        
        cell.NameLabel.text = Folders[indexPath.row].lastPathComponent
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selected = Folders[indexPath.row]
        performSegue(withIdentifier: "Content_List", sender: nil)
    }
    
    
   
}


extension MainController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWith = collectionView.frame.width / 2
        
        return CGSize(width: itemWith - 10, height: 150)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let id = segue.identifier, id == "New_Folder" {
            
            if let newfolder = segue.destination as? CreateFolderController {
                newfolder.del = self
            }
        }
        
        if let id = segue.identifier, id == "Content_List" {
            
            if let fileList = segue.destination as? FileList {
                fileList.selected = selected
            }
        }
    }
}
