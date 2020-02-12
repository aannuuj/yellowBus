//
//  gmapViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 13/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase
import FirebaseDatabase

class gmapViewController: UIViewController, GMSMapViewDelegate {
    private var infoWindow = MapMarkerWindow()
    fileprivate var locationMarker : GMSMarker? = GMSMarker()
   
    override func viewDidLoad() {
    super.viewDidLoad()
        
       

        let ref = Database.database().reference()
        ref.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let Lat = snap.childSnapshot(forPath: "lat")
                 let Longi = snap.childSnapshot(forPath: "long")
                
                
                
            }
        })
    }

}
