//
//  cancourseViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 12/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit
import Mapbox
 
class cancourseViewController: UIViewController, MGLMapViewDelegate {
override func viewDidLoad() {
super.viewDidLoad()
 
let url = URL(string: "mapbox://styles/mapbox/streets-v11")
let mapView = MGLMapView(frame: view.bounds, styleURL: url )
mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
mapView.setCenter(CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407 ), zoomLevel: 20, animated: true)
    mapView.tintColor = .darkGray
view.addSubview(mapView)
    // Set the delegate property of our map view to `self` after instantiating it.
    mapView.delegate = self
     
    // Declare the marker `hello` and set its coordinates, title, and subtitle.
    let hello = MGLPointAnnotation()
    hello.coordinate = CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407)
    hello.title = "Bus 1"
    hello.subtitle = "Shuttle Bus"
     
    // Add marker `hello` to the map.
    mapView.addAnnotation(hello)
    }
   

  
    // Allow callout view to appear when an annotation is tapped.
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
    return true
    }
    }
