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
    @IBOutlet var mapView: MKMapView?
    @IBOutlet var label: UILabel?
    @IBAction func currentLocation(sender: UIButton) {
        
    }
    
    //MARK: Properties
    var startLocation: CLLocation!
    var locationManager = CLLocationManager()
    var myLocations:    [CLLocation] = []
    var tabBarView:     AKITabBarView?
    
    //MARK: override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.delegate = self

        self.locationManager.requestLocation()
        self.locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: location
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView?.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        self.label?.text = "locations = \(locValue.latitude) \(locValue.longitude)"
    }
}
