//
//  loginViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 11/04/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class loginViewController: UIViewController, GIDSignInDelegate {
  
    @IBOutlet weak var googleSignIn: GIDSignInButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    GIDSignIn.sharedInstance().delegate = self
    
    GIDSignIn.sharedInstance()?.presentingViewController = self
    GIDSignIn.sharedInstance()?.restorePreviousSignIn()
       
  }
// Present a sign-in with Google window
    @IBAction func googleSignIn(_ sender: GIDSignInButton!) {
          GIDSignIn.sharedInstance().signIn()
     
    }
   
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    print("Google Sing In didSignInForUser")
    
    if let erroe = error {
      print(erroe.localizedDescription)
      return
    }
    else {
        print(user.profile.name as Any)
        performSegue(withIdentifier: "goToFeed", sender: self)
    }
    guard let authentication = user.authentication else { return }
    let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
// When user is signed in
    Auth.auth().signIn(with: credential, completion: { (user, error) in
      if let e = error {
        print(e.localizedDescription)
        return
      }
        
        
    })
  }

}

