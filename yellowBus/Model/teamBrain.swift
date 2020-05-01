//
//  teamBrain.swift
//  yellowBus
//
//  Created by Hariom Palkar on 16/04/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import Foundation
import UIKit
struct Team {
  
    func share(){
    let message = "Check this amazing app"
                //Set the link to share.
                if let link = NSURL(string: "http://")
                {
                 let objectsToShare = [message,link] as [Any]
                    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                 activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        }
    }

}
