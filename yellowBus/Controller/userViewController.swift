//
//  scheduleViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 12/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//
import LocalAuthentication
import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn


class userViewController: UIViewController, GIDSignInDelegate {
   func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                 withError error: Error!) {
         if let error = error {
           if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
             print("The user has not signed in before or they have since signed out.")
           } else {
             print("\(error.localizedDescription)")
           }
           return
         }
         // Perform any operations on signed in user here.
         let userId = user.userID                  // For client-side use only!
        
           let idToken = user.authentication.idToken // Safe to send to the server
         let fullName = user.profile.name
         let givenName = user.profile.givenName
         let familyName = user.profile.familyName
         let emailID = user.profile.email
         
       }
    
    
 
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
 
        self.becomeFirstResponder() // To get shake gesture
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let optionMenu = UIAlertController(title: nil, message: "Thank You for using Yellow Bus", preferredStyle: .actionSheet)
            
            let deleteAction = UIAlertAction(title: "Rate Us", style: .default)
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(cancelAction)
            self.present(optionMenu, animated: true, completion: nil)
            
        }
    }
    @IBAction func signOut(_ sender: UIButton) {
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        do{
            try GIDSignIn.sharedInstance().signOut()
            touchID()
        }
        catch let err{
            print(err.localizedDescription)
        }
    }
    
    
    @IBAction func fileButton(_ sender: UIButton) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Please verify yourself to proceed."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        
                        self?.unlockSecretMessage()
                    }
                    else {
                        let ac = UIAlertController(title: "Authentication failed", message: "We Could not verify you; Please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "Ok", style: .default ))
                        self?.present(ac , animated: true)
                        
                    }
                }
            }
        }
        else{ let ac = UIAlertController(title: "Biometry unavailable", message: "You are dumb", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default ))
            self.present(ac , animated: true)
        }
    }
    func unlockSecretMessage(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    func touchID() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Identify yourself"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        
                        unlockSecretMessage()
                    }
                    else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You Could not be verified; Please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "Ok", style: .default ))
                        self?.present(ac , animated: true)
                        
                    }
                }
            }
        }
        else{ let ac = UIAlertController(title: "Biometry unavailable", message: "Your device does not have biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default ))
            self.present(ac , animated: true)
        }
        
        func unlockSecretMessage(){
            navigationController?.popToRootViewController(animated: true)
        }
        
        
        
        
    }
    
    
    
    
    
}
