//
//  ForecastModel.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import Foundation

extension ForecastViewController {
    struct Model {
        var sectionModels: [ForecastSectionModel]
        var locationDescription: String
        
        init(sectionModels: [ForecastSectionModel] = [ForecastSectionModel](), city: String = "", countryCode: String = "") {
            self.sectionModels = sectionModels
            self.locationDescription = "\(city), \(countryCode)"
        }
    }
}
