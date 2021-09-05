//
//  TemperatureManager.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import Foundation

class TemperatureManager {
    static func celsiusToKelvin(_ degrees: Double) -> Double {
        degrees + 273
    }
    
    static func kelvinToCelsius(_ degrees: Double) -> Double {
        degrees - 273
    }
}
