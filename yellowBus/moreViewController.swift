//
//  moreViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 05/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit

class moreViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 


     @IBAction func logoutButton(_ sender: Any) {
       let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
     
    }


}
