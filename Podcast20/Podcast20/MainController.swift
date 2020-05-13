//
//  ViewController.swift
//  Podcast20
//
//  Created by George Digmelashvili on 5/13/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
import CoreData

class MainController: UIViewController{
    @IBOutlet weak var Table: UITableView!
    
    var podcasts = [Podcast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Table.delegate = self
        Table.dataSource = self
        Fetch()
    }
    
    
}




extension MainController: UITableViewDelegate, UITableViewDataSource, Services {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "Podcast_Cell", for: indexPath) as! PodcastCell
        cell.DurationLabel.text = duration(dur: podcasts[indexPath.row].duration)
        cell.HeaderLabel.text = podcasts[indexPath.row].name
        cell.AboutLabel.text = podcasts[indexPath.row].about
        return cell
    }
    
    
    func Fetch() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Podcast> = Podcast.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            
            podcasts = result
            
        } catch {}
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "New_Podcast" {
            
            if let newPod = segue.destination as? NewPodcastController {
                newPod.del = self
            }
        }
        
        if let id = segue.identifier, id == "Filter_Controller" {
            if let filter = segue.destination as? FilterController {
                filter.del = self
            }
        }
    }
    
    func update() {
        Fetch()
        Table.reloadData()
    }
    
    func filter(_ dur: Int) {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Podcast> = Podcast.fetchRequest()
        request.predicate = NSPredicate(format: "duration < \(dur)")
        do {
            let result = try context.fetch(request)
            
            podcasts = result
            
        } catch {}
        Table.reloadData()
    }
    
    func duration(dur: Int32) -> String{
        let dur =  dur //Int(DurationPicker.countDownDuration)
        let s = dur / 60 % 60
        let min = s < 10 ? "0" + String(s) : String(s)
        let time = String(dur / 60 / 60) + ":" + min
        return time
    }
    
}

