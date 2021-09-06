//
//  Service+Converter.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import UIKit

extension Service {
    class Converter {
        
        // MARK: - TodayWeather
        
        static func convert(from serviceModel: TodayWeatherResponse) -> TodayViewController.Model {
            var model = TodayViewController.Model(
                city: serviceModel.name,
                countryCode: serviceModel.sys.country,
                iconName: serviceModel.weather.first!.icon,
                temperature: serviceModel.main.temp,
                description: serviceModel.weather.first!.main,
                pressure: serviceModel.main.pressure,
                cloudiness: serviceModel.clouds.all,
                humidity: serviceModel.main.humidity,
                windSpeed: serviceModel.wind.speed,
                windDirection: serviceModel.wind.deg
            )
            
            let details = TodayViewController.Details(
                humidity: .init(icon: UIImage(systemName: "cloud.drizzle.fill")!, description: model.humidity),
                cloud: .init(icon: UIImage(systemName: "drop.fill")!, description: model.cloudiness),
                pressure: .init(icon: UIImage(systemName: "barometer")!, description: model.pressure),
                windSpeed: .init(icon: R.image.wind()!, description: model.windSpeed),
                windDirection: .init(icon: R.image.compass()!, description: model.windDirection)
            )
            
            model.details = details
            
            return model
        }
        
        // MARK: - Forecast
        
        static func convert(from serviceModel: ForecastServiceModel) -> ForecastViewController.Model {
            var model = ForecastViewController.Model(city: serviceModel.city.name, countryCode: serviceModel.city.country)
            for forecastItem in serviceModel.list {
                let itemModel = Self.convert(from: forecastItem)
                if model.sectionModels.isEmpty || itemModel.hour == "00:00" { // new day
                    model.sectionModels.append(getNewSection(viewModel: itemModel))
                }
                model.sectionModels[model.sectionModels.count-1].rowModels.append(itemModel)
            }
            return model
        }
        
        private static func getNewSection(viewModel: ForecastItemModel) -> ForecastSectionModel {
            let weekday = TimeManager.getWeekday(timeIntervalSince1970: TimeInterval(viewModel.timeFrom1970))
            let headerModel = ForecastSectionHeaderModel(weekday: weekday)
            return ForecastSectionModel(headerModel: headerModel, rowModels: [])
        }
        
        private static func convert(from item: ForecastServiceItemModel) -> ForecastItemModel {
            ForecastItemModel(
                date: item.dt,
                dateText: item.dt_txt,
                description: item.weather.first!.description,
                iconName: item.weather.first!.icon,
                temperature: (Int(item.main.temp))
            )
        }
    }
}
