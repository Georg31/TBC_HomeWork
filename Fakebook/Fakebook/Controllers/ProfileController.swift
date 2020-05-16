//
//  ProfileController.swift
//  Fakebook
//
//  Created by George Digmelashvili on 5/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    var user = UserDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let s = self.tabBarController as! MainTabBarController
        self.user = s.user
        asign()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageVIewTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
        
        
    }
    
    @objc func onImageVIewTapped() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    func asign(){
        imageView.image = UIImage(data: user.profileImage!)
        nameTextField.text = user.name
        lastNameTextField.text = user.lastname
        emailTextField.text = user.email
        passwordTextField.text = user.password
    }

    func updateUser(){
         let img = imageView.image!.pngData()!
        Dbase.updateUser(user, nameTextField.text!, lastNameTextField.text!, emailTextField.text!, passwordTextField.text!, img)
    }
    
    @IBAction func UpdateUserButton(_ sender: UIButton) {
        updateUser()
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[.editedImage] as? UIImage {
               self.imageView.image = image
           }
           
           self.dismiss(animated: true)
       }
}
