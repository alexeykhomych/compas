//
//  AKITabBarViewController.swift
//  Compas
//
//  Created by Alexey Khomych on 31.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AKITabBarViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    //MARK: Properties
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    
    //MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        let myview = AKITabBarView()
        let mapView = myview.mapView
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
