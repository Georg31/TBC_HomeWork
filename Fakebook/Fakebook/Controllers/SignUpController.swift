//
//  SignUpController.swift
//  Fakebook
//
//  Created by George Digmelashvili on 5/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class SignUpController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var RePassowrdTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageVIewTapped))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGesture)
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }

       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           NotificationCenter.default.removeObserver(self)
       }
       
       @objc func keyboardWillShow(notification:NSNotification){
           let userInfo = notification.userInfo!
           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
           keyboardFrame = self.view.convert(keyboardFrame, from: nil)

           var contentInset:UIEdgeInsets = self.scrollView.contentInset
           contentInset.bottom = keyboardFrame.size.height
           scrollView.contentInset = contentInset
       }

       @objc func keyboardWillHide(notification:NSNotification){

           let contentInset:UIEdgeInsets = UIEdgeInsets.zero
           scrollView.contentInset = contentInset
       }
    
    
    
    
    
    
    @objc func onImageVIewTapped() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        if validate(){return}
        let img = profileImageView.image!.pngData()!
        Dbase.regUser(UserNameTextField.text!, NameTextField.text!, LastNameTextField.text!, EmailTextField.text!, PasswordTextField.text!, data: img)
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension SignUpController{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.profileImageView.image = image
        }
        
        self.dismiss(animated: true)
    }
    
    func validate() -> Bool{
        if  NameTextField.text!.isEmpty ||
            LastNameTextField.text!.isEmpty ||
            UserNameTextField.text!.isEmpty ||
            EmailTextField.text!.isEmpty ||
            PasswordTextField.text!.isEmpty ||
            RePassowrdTextField.text != PasswordTextField.text
            {return true}
        else{return false}
    }
    func clear(){
        
    }
}
