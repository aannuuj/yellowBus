//
//  loginViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 07/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit
import FBSDKCoreKit

class loginViewController: UIViewController {
  
    override func viewDidLoad() {
     super.viewDidLoad()
    
    
     // Do any additional setup after loading the view, typically from a nib.
        var loginButton = FBLoginButton(permissions: [.publicProfile])
     loginButton.center = view.center
     self.view.addSubview(loginButton)
    
      if let accessToken = AccessToken.current {
            // User is already logged in with facebook
            print("User is already logged in")
            print(accessToken)
        // Extend the code sample "1. Add Facebook Login Button Code"
        // In your viewDidLoad method:
        loginButton = FBLoginButton(
            permissions: [ .publicProfile, .email, .userFriends ]
        )
        }
    }
    }
    func loginButtonDidCompleteLogin(_ loginButton: FBLoginButton, result: LoginResult) {
          print("User logged in")
          
          switch result {
          case .failed(let err):
              print(err)
          case .cancelled:
              print("cancelled")
          case .success(let grantedPermissions, let declinedPermissions, let accessToken):
              print("success")
            
            
            
          }
      }
