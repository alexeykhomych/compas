//
//  AKIMapController.swift
//  Compas
//
//  Created by Alexey Khomych on 03.11.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AKIMapController: AKIAbstractController, CLLocationManagerDelegate {
    //MARK: Properties
    
    var locationManager = CLLocationManager()
    var myLocations = [CLLocation]()
    
    var mapView: AKIMapView? {
        return self.getView()
    }
    
    //MARK: Override methods
    
    override func initProperty() {
        self.initLocationManager()
        
    }
    
    //MARK: Private methods
    
    private func printLocation(coordinate: CLLocationCoordinate2D) {
        self.mapView?.labelCurrentLocation?.text = "locations = \(coordinate.latitude) \(coordinate.longitude)"
    }
    
    private func initLocationManager() {
        let manager = self.locationManager
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestLocation()
        manager.startUpdatingLocation()
    }
    
    //MARK: Location
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let map = self.mapView?.mapView
        if let location = locations.last?.coordinate {
            let center = CLLocationCoordinate2D(latitude: location.latitude,
                                                longitude: location.longitude)
            
            let region = MKCoordinateRegion(center: center,
                                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
            
            map?.setRegion(region, animated: true)
        }
        
        self.printLocation(manager.location!.coordinate)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
}
