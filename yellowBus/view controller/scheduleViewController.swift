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

    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Logout(_ sender: Any) {
           let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
                         
                     // 2
                     let deleteAction = UIAlertAction(title: "Delete", style: .default)
                     let saveAction = UIAlertAction(title: "Save", style: .default)
                         
                     // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
                       
                     // 4
                     optionMenu.addAction(deleteAction)
                     optionMenu.addAction(saveAction)
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
