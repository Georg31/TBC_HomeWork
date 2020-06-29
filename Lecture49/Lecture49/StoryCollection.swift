//
//  StroryCollection.swift
//  Lecture49
//
//  Created by George Digmelashvili on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class StoryCollection: UICollectionViewController {
    
    
    
    var cell: StoryCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateViews()
        confgurePanGesture()
        self.collectionView.scrollToItem(at: IndexPath(row:cell!.index - 1, section: 0), at: .right, animated: false)
        
    }
    
    private func UpdateViews(){
        
    }
    
    private func confgurePanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        view.addGestureRecognizer(panGesture)
        
    }
    
    
    
    @objc func didPan(_ gesture: UIPanGestureRecognizer) {
        let translateY = gesture.translation(in: gesture.view!).y
        
        if translateY < 0 {return}
        switch  gesture.state {
        case .began:
            break
        case .changed:
            gesture.view!.transform = CGAffineTransform(translationX: 0, y: translateY)
            
        case .ended:
            if translateY > 200 {
                self.dismiss(animated: true)
            } else {
                UIView.animate(withDuration: 0.3) {
                    gesture.view!.transform = .identity
                }
            }
        default:
            print("")
        }
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cell!.faces.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StoryCells
        cell.imgView.image = UIImage(named: (self.cell?.faces[indexPath.row])!) 
        cell.nameLabel.text = self.cell?.faces[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

extension StoryCollection: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
