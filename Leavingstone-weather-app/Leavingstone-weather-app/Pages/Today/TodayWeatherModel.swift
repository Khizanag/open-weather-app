//
//  TodayWeatherModel.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import Foundation
import UIKit

extension TodayViewController {
    
    struct DetailItemModel {
        var icon: UIImage
        var description: String
        
        init(icon: UIImage, description: String) {
            self.icon = icon
            self.description = description
        }
    }
    
    struct Details {
        var humidity: DetailItemModel
        var cloud: DetailItemModel
        var pressure: DetailItemModel
        var windSpeed: DetailItemModel
        var windDirection: DetailItemModel
    }
    
    struct Model {
        // MARK: - Properties
        private let _city: String
        private let _countryCode: String
        private let _iconName: String
        private let _temperature: Double
        private let _description: String
        private let _pressure: Int
        private let _cloudiness: Int
        private let _humidity: Int
        private let _windSpeed: Double
        private let _windDirection: Int
        
        public var details: Details?

        // MARK: - Init
        init(
            city: String,
            countryCode: String,
            iconName: String,
            temperature: Double,
            description: String,
            pressure: Int,
            cloudiness: Int,
            humidity: Int,
            windSpeed: Double,
            windDirection: Int,
            details: Details? = nil
        ) {
            self._city = city
            self._countryCode = countryCode
            self._iconName = iconName
            self._temperature = temperature
            self._description = description
            self._pressure = pressure
            self._cloudiness = cloudiness
            self._humidity = humidity
            self._windSpeed = windSpeed
            self._windDirection = windDirection
            self.details = details
        }
        
        // MARK: - Public getter methods

        public var city: String { _city }

        public var countryCode: String { _countryCode }

        public var iconName: String { _iconName }

        public var temperature: String { "\(Int(TemperatureManager.kelvinToCelsius(_temperature)))°C" }

        public var description: String { "\(temperature) | \(_description)" }
        
        public var pressure: String { "\(_pressure) hPa" }

        public var cloudiness: String { _cloudiness == 0 ? "-" : "\(_cloudiness)" }

        public var humidity: String { "\(_humidity) mm" }

        public var windSpeed: String { "\(_windSpeed) km/h" }

        public var locationDescription: String { "\(city), \(countryCode)" }
        
        // MARK: - Private methods
        
        public var windDirection: String {
            let realDirectionGradus = (_windDirection + 360) % 360
            let direction = Int(realDirectionGradus / (360 / Self.directions.count))
            return Self.directions[direction]
        }

        private static let directions = [ "N", "NW", "W", "SW", "S", "SE", "E", "NE" ]
    }
}
