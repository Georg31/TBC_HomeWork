//
//  ViewController.swift
//  Homework-36
//
//  Created by George Digmelashvili on 6/8/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControll: UIPageControl!
    var pages = [Page]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPages()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    @IBAction func SkipButton(_ sender: UIButton) {
        var index = collectionView.indexPathsForVisibleItems.first!
        index.row = pages.count - 1 
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        var index = collectionView.indexPathsForVisibleItems.first!
        index.row += 1
        if index.row < pages.count{
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    
    
    private func setupPages() {
        let page1 = Page(imageNamed: "img1", title: "Online shopping", text: "Women Fashion Shopping Online - Shop from a huge range of latest women clothing, shoes, makeup Kits, Watches, footwear and more for women at best price")
        let page2 = Page(imageNamed: "img2", title: "Add to cart", text: "Add to cart button works on product pages. The customizations in this section  compatible with dynamic checkout buttons")
        let page3 = Page(imageNamed: "img3", title: "Payment Successful", text: "Your payment has been successfully completed. You will receive a confirmation email within a few minutes.")
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        pageControll.numberOfPages = self.pages.count
        
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PageCell
        cell.bind(page: pages[indexPath.row])
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        pageControll.currentPage = collectionView.indexPathsForVisibleItems.first!.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: super.view.bounds.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



struct Page {
    let imageNamed: String
    let title: String
    let text: String
    
    var image: UIImage? {
        return UIImage(named: imageNamed)
    }
}

