//
//  IconPathFactory.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 03.09.21.
//

import Foundation

class IconPathFactory {

    static func build(for iconName: String) -> String {
        return "https://openweathermap.org/img/wn/\(iconName)@2x.png"
    }
    
}

extension IconPathFactory {
    struct Constants {
        static let imagesPath = "img/wn"
        static let imageEnding = "@2x.png"
    }
}
