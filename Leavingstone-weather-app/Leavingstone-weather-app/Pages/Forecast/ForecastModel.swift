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
        
        init(sectionModels: [ForecastSectionModel] = [ForecastSectionModel]()) {
            self.sectionModels = sectionModels
        }
    }
}
