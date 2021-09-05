//
//  Constants.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

import Foundation

struct AppConstants {
    public static let apiKey = "c213fdc74458979dc1c4538922878c2b"

    enum IconName: String {
        case cloudiness = "raining"
        case humidity = "drop"
        case windSpeed = "wind"
        case windDirection = "compass"
        case defaultIcon = "sun"
    }
}
