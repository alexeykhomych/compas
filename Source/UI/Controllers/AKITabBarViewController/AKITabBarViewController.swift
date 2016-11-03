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

//extension UIViewController {
//    func getView<R>() -> R? {
//        return self.viewIfLoaded.flatMap { $0 as? R }
//    }
//}

class AKITabBarViewController: UITabBarController {    
    //MARK: Properties
    
    var tabBarView: AKITabBarView? {
        return self.getView()
    }
    
    //MARK: override methods
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        print("suqa")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapController = AKIMapController()
        let compassController = AKICompassController()
        let locationController = AKILocationController()
        
//        let mapNavigationController = UINavigationController(rootViewController: mapController)
//        mapNavigationController.title = "Map"
//        mapNavigationController.tabBarItem.image = UIImage(named: "map")
        
//        let mapNavigationController = self.navigationController(mapController, title: "Map")
        
//        let locationNavigationController = UINavigationController(rootViewController: locationController)
//        locationNavigationController.title = "Location"
//        locationNavigationController.tabBarItem.image = UIImage(named: "location")
//        
        
//        let compassNavigationController = UINavigationController(rootViewController: compassController)
//        compassNavigationController.title = "Compass"
//        compassNavigationController.tabBarItem.image = UIImage(named: "compass")
        
//        viewControllers = [mapNavigationController, locationNavigationController, compassNavigationController]
        viewControllers = [self.navigationController(mapController, title: "Map"),
                            self.navigationController(locationController, title: "Location"),
                            self.navigationController(compassController, title: "Compass")]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Private methods
    
    private func navigationController(controller: UIViewController, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.title = title
        navigationController.tabBarItem.image = UIImage(named: title.lowercaseString)
        
        return navigationController
    }
}
