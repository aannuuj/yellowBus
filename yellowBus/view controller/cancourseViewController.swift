////
////  cancourseViewController.swift
////  yellowBus
////
////  Created by Hariom Palkar on 12/02/20.
////  Copyright © 2020 Hariom Palkar. All rights reserved.
////
//
//import UIKit
//import Mapbox
// import Firebase
// import FirebaseDatabase
//
//class cancourseViewController: UIViewController, MGLMapViewDelegate {
//
//
//override func viewDidLoad() {
//super.viewDidLoad()
//
//    let ref = Database.database().reference()
//               ref.observeSingleEvent(of: .value, with: { snapshot in
//                   for child in snapshot.children {
//
//
//
//
//                       for rest in snapshot.children.allObjects as! [DataSnapshot] {
//                                      guard let Dict = rest.value as? [String: AnyObject] else {
//                                          continue
//                                      }
//                                       let snap = child as! DataSnapshot
//                                                    let latitude = snap.childSnapshot(forPath: "lat")
//                                                     let longitude = snap.childSnapshot(forPath: "long")
//
//
//                         print(longitude)
//                          print(latitude)
//                              }
//                                                        }
//let mapView = MGLMapView(frame: view.bounds)
//mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//mapView.delegate = self
//
//// Set the map’s center coordinate and zoom level.
//mapView.setCenter(CLLocationCoordinate2D(latitude: 41.8864, longitude: -87.7135), zoomLevel: 13, animated: false)
//view.addSubview(mapView)
//}
//
//func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
//
//// Create point to represent where the symbol should be placed
//let point = MGLPointAnnotation()
//point.coordinate = mapView.centerCoordinate
//
//// Create a data source to hold the point data
//let shapeSource = MGLShapeSource(identifier: "marker-source", shape: point, options: nil)
//
//// Create a style layer for the symbol
//let shapeLayer = MGLSymbolStyleLayer(identifier: "marker-style", source: shapeSource)
//
//
//
//// Tell the layer to use the image in the sprite
//shapeLayer.iconImageName = NSExpression(forConstantValue: "home-symbol")
//
//// Add the source and style layer to the map
//style.addSource(shapeSource)
//style.addLayer(shapeLayer)
//})
//}
//
