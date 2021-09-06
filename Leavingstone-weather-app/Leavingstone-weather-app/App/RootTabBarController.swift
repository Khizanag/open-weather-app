//
//  RootTabBarController.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

import CoreData
import UIKit

class RootTabBarController: UITabBarController {
    
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

}

extension RootTabBarController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        UserDefaultsManager.saveCurrentLocation(LocationFactory.convert(from: location))
    }
    
}
