
import UIKit
import GoogleMaps
import Firebase
import FirebaseDatabase

class gmapViewController: UIViewController, GMSMapViewDelegate {
    
   
    override func viewDidLoad() {
    super.viewDidLoad()
        
          let ref = Database.database().reference()
             ref.observeSingleEvent(of: .value, with: { snapshot in
                 for child in snapshot.children {
                   
                     
                   

                     for rest in snapshot.children.allObjects as! [DataSnapshot] {
                                    guard let Dict = rest.value as? [String: AnyObject] else {
                                        continue
                                    }
                                     let snap = child as! DataSnapshot
                                                  let latitude = snap.childSnapshot(forPath: "lat")
                                                   let longitude = snap.childSnapshot(forPath: "long")
                       
                        
                       print(longitude)
                        print(latitude)
                            
                        
                        
                        
//                                    let marker = GMSMarker()
//                                    marker.position = CLLocationCoordinate2D(latitude: latitude as! CLLocationCoordinate2D, longitude: longitude as! CLLocationCoordinate2D)

                                   
                                   
                                }
                            }
     //      override func loadView() {
     //        // Create a GMSCameraPosition that tells the map to display the
     //        // coordinate -33.86,151.20 at zoom level 6.
     //        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
     //        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
     //        view = mapView
     //
     //        // Creates a marker in the center of the map.
     //        let marker = GMSMarker()
     //        marker.position = CLLocationCoordinate2D(latitude: Lat, longitude: Longi)
     //        marker.title = "Sydney"
     //        marker.snippet = "Australia"
     //        marker.map = mapView
     //      }
     //    }
    })
}
}
