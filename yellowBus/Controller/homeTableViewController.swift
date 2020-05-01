//
//  homeTableViewController.swift
//  
//
//  Created by Hariom Palkar on 01/05/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var blurView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        blurView.layer.cornerRadius = 30
        blurView.clipsToBounds = true
      
    }

 

}
