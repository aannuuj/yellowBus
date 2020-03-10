//
//  cancourseViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 12/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit
import Mapbox
 import Firebase
 import FirebaseDatabase

class cancourseViewController: UIViewController, MGLMapViewDelegate {
    
    
override func viewDidLoad() {
super.viewDidLoad()
//    let ref = Database.database().reference()
//              ref.observeSingleEvent(of: .value, with: { snapshot in
//                  for child in snapshot.children {
//
//
//
//
//                      for rest in snapshot.children.allObjects as! [DataSnapshot] {
//                                     guard let Dict = rest.value as? [String: AnyObject] else {
//                                         continue
//                                     }
//                                      let snap = child as! DataSnapshot
//                                                   let Lat = snap.childSnapshot(forPath: "lat")
//                                                    let Longi = snap.childSnapshot(forPath: "long")
//                    }
//                }
//    )
//    }
    
//              override func loadView() {
let url = URL(string: "mapbox://styles/mapbox/streets-v11")
let mapView = MGLMapView(frame: view.bounds, styleURL: url )
mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
mapView.setCenter(CLLocationCoordinate2D(latitude: 35.68476, longitude:-220.24257 ), zoomLevel: 10, animated: true)
    mapView.tintColor = .darkGray
view.addSubview(mapView)
    // Set the delegate property of our map view to `self` after instantiating it.
    mapView.delegate = self
     
    // Declare the marker `hello` and set its coordinates, title, and subtitle.
//    let hello = MGLPointAnnotation()
//    hello.coordinate = CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407)
//    hello.title = "Bus 1"
//    hello.subtitle = "Shuttle Bus"
    let coordinates = [
        CLLocationCoordinate2D(latitude: 35.68476, longitude: -220.24257),
        CLLocationCoordinate2D(latitude: 37.78428, longitude: -122.41310)
    ]
    let polyline = MGLPolyline(coordinates: coordinates, count: UInt(coordinates.count))
    // Add marker `hello` to the map.
//    mapView.addAnnotation(hello)
    }
   

  
    // Allow callout view to appear when an annotation is tapped.
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
    return true
    }
    }
