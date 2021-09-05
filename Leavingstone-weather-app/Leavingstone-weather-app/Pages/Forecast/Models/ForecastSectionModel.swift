//
//  ForecastSectionModel.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 03.09.21.
//

import Foundation

struct ForecastSectionModel {

    public var headerModel: ForecastSectionHeaderModel
    public var rowModels: [ForecastItemModel]

    init(
        headerModel: ForecastSectionHeaderModel,
        rowModels: [ForecastItemModel]
    ) {
        self.headerModel = headerModel
        self.rowModels = rowModels
    }

}
