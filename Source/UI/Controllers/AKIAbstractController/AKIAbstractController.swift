//
//  AKIAbstractController.swift
//  Compas
//
//  Created by Alexey Khomych on 03.11.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

extension UIViewController {
    func getView<R>() -> R? {
        return self.viewIfLoaded.flatMap { $0 as? R }
    }
}

class AKIAbstractController: UIViewController, MKMapViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initProperty()
    }
    
    func initProperty() {
        
    }
}
