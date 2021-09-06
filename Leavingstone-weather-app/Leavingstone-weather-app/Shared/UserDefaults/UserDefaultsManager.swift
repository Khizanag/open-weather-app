//
//  UserDefaultsManager.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 03.09.21.
//

import Foundation
import UIKit

class UserDefaultsManager {
    
    static let userDefaults = UserDefaults.standard
    
    static func getCurrentLocation() -> Location? {
        guard let encodedData = userDefaults.object(forKey: UserDefaultsKeys.currentLocation.rawValue) as! Data? else { return nil }
        return try? PropertyListDecoder().decode(Location.self, from: encodedData)
    }
    
    static func saveCurrentLocation(_ location: Location) {
        let encodedData = try? PropertyListEncoder().encode(location)
        userDefaults.set(encodedData, forKey: UserDefaultsKeys.currentLocation.rawValue)
    }
    
}
