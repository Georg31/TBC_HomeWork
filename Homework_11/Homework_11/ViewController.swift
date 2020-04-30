//
//  ViewController.swift
//  Homework_11
//
//  Created by George Digmelashvili on 4/30/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

protocol IdService {
    func editor(news: News)
}


class ViewController: UIViewController, addnews{
    
  
    @IBOutlet weak var tableView: UITableView!
    var del : IdService?
    var news = [News]()
    var newsVC: UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidAppear(true)
        // Do any additional setup after loading the view.
       
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    @IBAction func TopButton(_ sender: UIBarButtonItem) {
        
        tableView.setContentOffset(.zero, animated: true)
    }
    
    @IBAction func AddNewsButton(_ sender: UIBarButtonItem) {
       
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        newsVC = storyBoard.instantiateViewController(withIdentifier: "Add_News_Controller")
        if let unwrappedVC = newsVC as? AddNewsControll{
            unwrappedVC.delegate = self
        }
             
        self.navigationController?.pushViewController(newsVC!, animated: true)
        
        
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_cell_id", for: indexPath) as! NewsTableViewCell
        
        let news = self.news[indexPath.row]
        
        
        cell.TitleLabel.text = news.title
        cell.BodyLabel.text = news.body
        
       
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newsvc = storyBoard.instantiateViewController(withIdentifier: "Detailed_News_Controller")
        if let unwrappedVC = newsvc as? ReadNews{
            unwrappedVC.body = news[indexPath.row].body
            unwrappedVC.Title = news[indexPath.row].body
            
        }
             
        self.navigationController?.pushViewController(newsvc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            
            self.news.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            handler(true)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (actiib, view, handler) in
            let n = self.news[indexPath.row]
            self.del?.editor(news: n)
            //self .self.news[indexPath.row] = e!
            self.navigationController?.pushViewController(self.newsVC!, animated: true)
        }
        edit.backgroundColor = .systemIndigo
        
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        
        
        return config
    }
    
    
    
    
    func addnew(new: News) {
        let n = new
        self.news.append(n)
        print(news.count)
    }
    func refresh(){
        tableView.reloadData()
    }
    
    
}


