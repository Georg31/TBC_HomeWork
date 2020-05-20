//
//  DetailController.swift
//  CountryApp
//
//  Created by George Digmelashvili on 5/20/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit
import WebKit

class DetailController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLAbel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet var webView: WKWebView!
    
    //@IBOutlet var webView: WKWebView!
    
    var country: Countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        sizing()
        AssignData()
        
    }
    
    
    func AssignData(){
        let img = country?.flag
        guard let url = URL(string: img!) else {return}
        let request = URLRequest(url: url)
        webView.load(request)
        
        navigationItem.title = country?.name
        capitalLabel.text! += country?.capital ?? "default value"
        regionLAbel.text! += (country?.region.rawValue)!
        areaLabel.text! += "\(country?.area ?? 0)"
        populationLabel.text! += "\(country?.population ?? 0)"
    }
    
    
    func sizing(){
        let webConfiguration = WKWebViewConfiguration()
        
        let customFrame = CGRect.init(origin: .zero, size: CGSize.init(width: 200, height: 130))
        self.webView = WKWebView (frame: customFrame , configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = true
        view.subviews.first?.addSubview(webView)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        //webView.scrollView.bounces = false
    }
    
}





