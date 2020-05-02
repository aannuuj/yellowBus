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

 var userManager = NSUserName()
// MARK:- Outlets
class loginViewController: UIViewController, GIDSignInDelegate {
    @IBOutlet weak var googleSignIn: GIDSignInButton!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var appLabel: UILabel!
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        signIn()
    }
   // restore sign in function
    func signIn(){
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    MARK: - Sign in setup
    @IBAction func googleSignIn(_ sender: GIDSignInButton!) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    // sign in function
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sing In didSignInForUser")
        
        if let errorOne = error {
            print(errorOne.localizedDescription)
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

