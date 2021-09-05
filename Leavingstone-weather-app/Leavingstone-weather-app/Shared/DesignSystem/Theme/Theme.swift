//
//  Theme.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import UIKit

typealias Color = UIColor

protocol Theme {
    var backgroudColor: Color { get }
}

struct LightTheme: Theme {
    let backgroudColor: Color = .white
}

struct DarkTheme: Theme {
    let backgroudColor: Color = .systemGray
}

enum ThemeType {
    case light, dark
    var associatedObject: Theme {
        switch self {
        case .light: return LightTheme()
        case .dark: return DarkTheme()
        }
    }
}

//let themeService = ThemeType.service(initial: .light)
//func themed<T>(_ mapper: @escaping((Theme) -> T)) ->
