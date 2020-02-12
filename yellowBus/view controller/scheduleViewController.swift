//
//  scheduleViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 12/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit


class scheduleViewController: UIViewController {

   
   override func viewDidLoad() {
       super.viewDidLoad()
       self.becomeFirstResponder() // To get shake gesture
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
                         
                     // 2
                     let deleteAction = UIAlertAction(title: "Rate Us", style: .default)
        
                     
                         
                     // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
                       
                     // 4
                     optionMenu.addAction(deleteAction)
                 
                     optionMenu.addAction(cancelAction)
                         
                     // 5
                     self.present(optionMenu, animated: true, completion: nil)
           
       }
   }
       
    
    @IBAction func Logout(_ sender: Any) {
           let optionMenu = UIAlertController(title: nil, message: "Thank You for using Yellow Bus", preferredStyle: .actionSheet)
                         
                     // 2
                     let deleteAction = UIAlertAction(title: "Login in with Other account", style: .default)
                     
                         
                     // 3
        let cancelAction = UIAlertAction(title: "Logout", style: .destructive)
                       
                     // 4
                     optionMenu.addAction(deleteAction)
                 
                     optionMenu.addAction(cancelAction)
                         
                     // 5
                     self.present(optionMenu, animated: true, completion: nil)
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

