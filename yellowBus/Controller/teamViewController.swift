////
////  teamViewController.swift
////  yellowBus
////
////  Created by Hariom Palkar on 12/02/20.
////  Copyright © 2020 Hariom Palkar. All rights reserved.
////
//
//import UIKit
//
//class teamViewController: UIViewController {
//
//    var appBrain = AppBrain()
//
//    @IBOutlet weak var ContactBtn: UILabel!{
//        didSet {
//
//        }
//    }
//    var feedbackGenerator : UISelectionFeedbackGenerator? = nil
//    @IBOutlet weak var shareBtn: UIButton!{
//        didSet {
//            appBrain.navFeedback()
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.becomeFirstResponder() // To get shake gesture
//        appBrain.navFeedback()
//    }
//
//    // We are willing to become first responder to get shake motion
//    override var canBecomeFirstResponder: Bool {
//        get {
//            return true
//        }
//    }
//    // Enable detection of shake motion
//    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        if motion == .motionShake {
//
////            if let url = NSURL(string: "https://www.aaruush.net/src/credits/index.html"){
////                UIApplication.shared.openURL(url as URL)
//            }
//        }
//    }
//    @IBAction func shareButtontapped(_ sender: Any) {
////
////        //Set the default sharing message.
////        let message = "Check this amazing app"
////        //Set the link to share.
////        if let link = NSURL(string: "http://")
////        {
////            let objectsToShare = [message,link] as [Any]
////            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
////            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
////            self.present(activityVC, animated: true, completion: nil)
////        }
////
//    }
////    @IBAction func contactUsButton(_ sender: Any) {
////
////        let application:UIApplication = UIApplication.shared
////        let generator = UISelectionFeedbackGenerator()
////        generator.selectionChanged()
////
////        let alert = UIAlertController(title: "Team Envision", message: "We are happy to help", preferredStyle: .alert)
////
////
////        let callAction = UIAlertAction(title: "Call", style: .default, handler: { (action) in
////            let phoneNumber: String = "tel:/7972803790"
////            application.open(URL(string: phoneNumber)!, options: [:], completionHandler: nil)
////            let generator = UIImpactFeedbackGenerator(style:.light)
////            generator.prepare()
////            generator.impactOccurred()
////
////        })
////
////        let messageAction = UIAlertAction(title: "Message", style: .default, handler: { (action) in
////            application.open(URL(string: "sms:7972803790")!, options: [:], completionHandler: nil)
////            let generator = UIImpactFeedbackGenerator(style:.light)
////            generator.prepare()
////            generator.impactOccurred()
////
////        })
////
////        let mapsAction = UIAlertAction(title: "Maps", style: .default, handler: { (action) in
////            let generator = UIImpactFeedbackGenerator(style:.light)
////            generator.prepare()
////            generator.impactOccurred()
////            let targetURL = URL(string: "https://goo.gl/maps/3Q1Go1FDAtWmhzT58")!
////            application.open(targetURL, options: [:], completionHandler: nil)
////
////        })
////        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
////            print("You've pressed Cancel")
////        }
////        alert.addAction(callAction)
////        alert.addAction(messageAction)
////        alert.addAction(mapsAction)
////        alert.addAction(cancel)
////
////        self.present(alert, animated: true, completion: nil)
////    }
////
////    //    @IBAction func instagram(_ sender: Any) {
////    //        let generator = UINotificationFeedbackGenerator()
////    //        generator.notificationOccurred(.success)
////    //         if let url = NSURL(string: "http://www.instagram.com/teamenvision_srm"){
////    //            UIApplication.shared.openURL(url as URL)
////    //
////    //    }
////    //
////    //       }
////    //
////    //    @IBAction func linkedin(_ sender: Any) {
////    //        let generator = UINotificationFeedbackGenerator()
////    //        generator.notificationOccurred(.success)
////    //        if let url = URL(string: "https://www.linkedin.com/company/team-envision/"){
////    //                UIApplication.shared.openURL(url as URL)
////    //
////    //    }
////    //    }
//}
//
//
//
//
