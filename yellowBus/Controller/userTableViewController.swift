//
//  UserViewController.swift
//  Alamofire
//
//  Created by Hariom Palkar on 01/05/20.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

var gameTimer: Timer?
var brain = AppBrain()
let shapeLayer = CAShapeLayer() // animation shape

class userTableViewController: UITableViewController {
    //MARK:- Outlets
    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var center: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImageFormat()
        self.becomeFirstResponder()
        navigationItem.title = "Profile"
//        animation()
    }
    
    func userImageFormat(){
        userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.clipsToBounds = true
    }
    
    // Willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
//            animation()
        }
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(true)
//            gameTimer?.invalidate()
        }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let rateUsMenu = UIAlertController(title: nil, message: "Thank You for using Yellow Bus", preferredStyle: .actionSheet)
            
            let rateUsAction = UIAlertAction(title: "Rate Us", style: .default, handler: { action in self.rateUS()})
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            rateUsMenu.addAction(rateUsAction)
            rateUsMenu.addAction(cancelAction)
            self.present(rateUsMenu, animated: true, completion: nil)
            
        }
    }
 
    
    @IBAction func signOut(_ sender: UIButton) {
        showSignOut()
    }
}

extension userTableViewController{
    func rateUS(){
         print("User want to rate us")
     }
     
     func showSignOut(){
         let signOutMenu = UIAlertController(title: nil, message: "Thank you for using Yellow Bus!", preferredStyle: .actionSheet)
         
         let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive, handler: { action in self.signOut()})
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
         signOutMenu.addAction(signOutAction)
         signOutMenu.addAction(cancelAction)
         self.present(signOutMenu, animated: true, completion: nil)
         
     }
     func signOut() {
         brain.navFeedback()
         do{
             try GIDSignIn.sharedInstance().signOut()
             navigationController?.popToRootViewController(animated: true)
         }
         catch let err{
             print(err.localizedDescription)
         }
     }
}


