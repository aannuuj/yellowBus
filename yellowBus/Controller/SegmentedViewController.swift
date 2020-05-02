//
//  SegmentedViewController.swift
//  Alamofire
//
//  Created by Hariom Palkar on 03/05/20.
//

import UIKit

class SegmentedViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var ThirdView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        print (sender.selectedSegmentIndex)
           if sender.selectedSegmentIndex == 0 {
             UIView.animate(withDuration: 0.5, animations: {
            print("Hey")
                self.firstView.alpha = 1
                self.secondView.alpha = 0
             self.ThirdView.alpha = 0
            })
           } else if  sender.selectedSegmentIndex == 1 {
             UIView.animate(withDuration: 0.5, animations: {
                self.firstView.alpha = 0
               self.secondView.alpha = 1
             self.ThirdView.alpha = 0
           })
           }
        else  if  sender.selectedSegmentIndex == 2 {
             UIView.animate(withDuration: 0.5, animations: {
             self.firstView.alpha = 0
             self.secondView.alpha = 0
             self.ThirdView.alpha = 1
        })
       }
}
}
