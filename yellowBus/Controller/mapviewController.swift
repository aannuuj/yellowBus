//
//  mapviewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 30/04/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//



import UIKit
import GoogleMaps
import Firebase
import FirebaseDatabase // Getting data from firebase


class mapViewController : UIViewController, GMSMapViewDelegate {
    
    var mapStyle = MapStyle()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 12.82200, longitude:  80.03867, zoom: 15.5)
        let mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        self.view = mapView
       
        mapView.animate(toZoom: 15.5)
        mapView.setMinZoom(15.5, maxZoom: mapView.maxZoom)
        do {
            // Set the map style by passing a valid JSON string.
            mapView.mapStyle = try GMSMapStyle(jsonString: mapStyle.kMapStyle)
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
       
        // get firebase data and plot markers
    
        DispatchQueue.main.async {
            
            let ref = Database.database().reference()
            ref.observeSingleEvent(of: .value, with: { snapshot in
                for child in snapshot.children {
                    for rest in snapshot.children.allObjects as! [DataSnapshot] {
                        guard (rest.value as? [String: AnyObject]) != nil else {
                            continue
                               }
                        let snap = child as! DataSnapshot
                        let latitude = snap.childSnapshot(forPath: "lat").value as! Double
                        let longitude = snap.childSnapshot(forPath: "long").value as! Double
                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                        marker.map = mapView
                        marker.userData = snap
                    }
                }
                
            })
            //            self.mapViewSnapshotReady?(mapView).reloadData()
        }
    }
}

