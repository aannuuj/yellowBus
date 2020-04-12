


import UIKit
import GoogleMaps
import Firebase
import FirebaseDatabase

let kMapStyle = "[" +
"  {" +
"    \"featureType\": \"all\"," +
"    \"elementType\": \"geometry\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#242f3e\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"all\"," +
"    \"elementType\": \"labels.text.stroke\"," +
"    \"stylers\": [" +
"      {" +
"        \"lightness\": -80" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"administrative\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#746855\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"administrative.locality\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#d59563\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"poi\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#d59563\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"poi.park\"," +
"    \"elementType\": \"geometry\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#263c3f\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"poi.park\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#6b9a76\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road\"," +
"    \"elementType\": \"geometry.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#2b3544\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#9ca5b3\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road.arterial\"," +
"    \"elementType\": \"geometry.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#38414e\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road.arterial\"," +
"    \"elementType\": \"geometry.stroke\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#212a37\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road.highway\"," +
"    \"elementType\": \"geometry.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#746855\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road.highway\"," +
"    \"elementType\": \"geometry.stroke\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#1f2835\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road.highway\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#f3d19c\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road.local\"," +
"    \"elementType\": \"geometry.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#38414e\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"road.local\"," +
"    \"elementType\": \"geometry.stroke\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#212a37\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"transit\"," +
"    \"elementType\": \"geometry\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#2f3948\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"transit.station\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#d59563\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"water\"," +
"    \"elementType\": \"geometry\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#17263c\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"water\"," +
"    \"elementType\": \"labels.text.fill\"," +
"    \"stylers\": [" +
"      {" +
"        \"color\": \"#515c6d\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"water\"," +
"    \"elementType\": \"labels.text.stroke\"," +
"    \"stylers\": [" +
"      {" +
"        \"lightness\": -20" +
"      }" +
"    ]" +
"  }" +
"]"
class gmapViewController: UIViewController, GMSMapViewDelegate {

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
                                     mapView.mapStyle = try GMSMapStyle(jsonString: kMapStyle)
                                   } catch {
                                     NSLog("One or more of the map styles failed to load. \(error)")
                                   }
        //poly line starts
                                let path = GMSMutablePath()
                                path.add(CLLocationCoordinate2D(latitude:12.822469, longitude: 80.048852))
                                                       path.add(CLLocationCoordinate2D(latitude: 12.822469, longitude: 80.048852))
                                                       
        
                                let polyline = GMSPolyline(path: path)
                                polyline.strokeWidth = 5.0
                                polyline.geodesic = true
                                polyline.map = mapView
        //
                                let solidBlue = GMSStrokeStyle.solidColor(.blue)
                                let solidBlueSpan = GMSStyleSpan(style: solidBlue)
                                let redYellow =
                                  GMSStrokeStyle.gradient(from: .red, to: .yellow)
                                let redYellowSpan = GMSStyleSpan(style: redYellow)
      
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


                        print(longitude)
                        print(latitude)


 
//
     
                   let marker = GMSMarker()
                   marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                   marker.map = mapView
                        
                   // *IMPORTANT* Assign all the spots data to the marker's userData property
                   marker.userData = snap

                        
                        


}
}
                

        })
}
}

