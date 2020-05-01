//
//  Extension.swift
//  yellowBus
//
//  Created by Hariom Palkar on 01/05/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//


import UIKit

//MARK:- Keyboard show + hide functions

    
    extension volViewController {
        
        // Function for tap gesture
        func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(volViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true) //selector action to dissmiss keyboard
        }

    // add observer
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Remove Observers
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Move view up /down only for bottomTextField
    @objc func keyboardWillShow(_ notification:Notification) {
        if visitorName.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        if visitorNumber.isFirstResponder {
            view.frame.origin.y = 0
        }
    }
}
    
    // Get the height of keyboard
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        let height = keyboardSize.cgRectValue.height // Height of Keyboard
        return height
    }

//MARK:- UITextField Delegate Methods
extension volViewController : UITextFieldDelegate {
    
    //Textfield empties first time
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Name" || textField.text == "Number" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension volViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
          var selectedImageFromPicker : UIImage? ///  FInal image will be assigned here
             
             if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                 visitorImage.image = editedImage
             } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                visitorImage.image = originalImage
             }
        addImageView.isHidden = true
    
        self.dismiss(animated: true, completion: nil ) /// Dissmiss picker

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled Image picker")
        picker.dismiss(animated: true, completion: nil)
    }
}

