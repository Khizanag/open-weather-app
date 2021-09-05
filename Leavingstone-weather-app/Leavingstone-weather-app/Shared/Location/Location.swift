//
//  Location.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 04.09.21.
//

import Foundation

struct Location: Codable {
    var longitude: Double
    var latitude: Double
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}
