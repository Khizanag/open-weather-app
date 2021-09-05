//
//  LocationFactory.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import CoreData
import Foundation

class LocationFactory {
    static func convert(from location: CLLocation) -> Location {
        Location(
            longitude: location.coordinate.longitude,
            latitude: location.coordinate.latitude
        )
    }
}
