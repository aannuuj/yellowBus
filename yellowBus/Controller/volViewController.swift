//
//  volViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 01/05/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit

class volViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var visitorImage: UIImageView!
    @IBOutlet weak var visitorName: UITextField!
    @IBOutlet weak var visitorNumber: UITextField!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var addImageView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorImage.image = #imageLiteral(resourceName: "icons8-github-240")
        hideKeyboardWhenTappedAround()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    // keyboard setup
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications() // REMOVE OBSERVERS
    }
    // get image of  visitor by camera or photo library
    @IBAction func pickAnImageFromAlbum(_ sender: UIButton) {
        presentImagePicker(.photoLibrary) /// Presents PhotoLibrary
    }
    @IBAction func pickAnImageFromCamera(_ sender: UIButton) {
        presentImagePicker(.camera) /// Presents Camera
    }
    // submit data of visitor
    
    @IBAction func submitButton(_ sender: Any) {
        clearData()
        
        //MARK:-To do
        // send data ro backend by getting the user data
    }
    
    func presentImagePicker(_ source : UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate // making this a delegate
        imagePicker.sourceType = source //Photo Library or Camera
        //             imagePicker.allowsEditing = true // Crop photo
        present(imagePicker, animated: true, completion: nil)
    }
    
    func clearData(){
        visitorImage.image = #imageLiteral(resourceName: "icons8-github-240")
        addImageView.isHidden = false
        visitorName.text?.removeAll()
        visitorNumber.text?.removeAll()
    }
    
    
}
