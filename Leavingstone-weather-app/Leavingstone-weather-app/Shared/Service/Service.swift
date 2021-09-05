//
//  Service.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

import Foundation

enum ServiceType {
    case weather
    case forecast
}

protocol ServiceProtocol {
    func requestTodayWeatherData(location: Location, completion: @escaping (Result<TodayViewController.Model, ServiceError>) -> ())
    func requestForecastWeatherData(location: Location, completion: @escaping (Result<ForecastViewController.Model, ServiceError>) -> ())
}

class Service: ServiceProtocol {

    private var components: URLComponents = {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.host
        return components
    }()
    
    private func getComponentPath(for type: ServiceType) -> String {
        switch type {
        case .forecast: return Constants.ComponentPaths.basePath + Constants.ComponentPaths.forecast
        case .weather: return Constants.ComponentPaths.basePath + Constants.ComponentPaths.weather
        }
    }
    
    private func setupRequestUrl(location: Location, serviceType: ServiceType) {
        let parameters = [
            Constants.ParameterKeys.appId: AppConstants.apiKey,
            Constants.ParameterKeys.longtitude: location.longitude.description,
            Constants.ParameterKeys.latitude: location.latitude.description,
        ]

        components.queryItems = parameters.map { key, value in URLQueryItem(name: key, value: value) }
        components.path = getComponentPath(for: serviceType)
    }
    
    // MARK: - ServiceProtocol
    
    public func requestTodayWeatherData(location: Location, completion: @escaping (Result<TodayViewController.Model, ServiceError>) -> ()) {
        setupRequestUrl(location: location, serviceType: .weather)
        
        guard let url = components.url else { completion(.failure(.wrongUrl)); return }

        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            
            if let error = error { completion(.failure(.requestError(error))) }

            guard let data = data else { completion(.failure(.noData)); return }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(TodayWeatherResponse.self, from: data)
                completion(.success(Converter.convert(from: result)))
            } catch {
                completion(.failure(.canNotDecode))
            }
        }).resume()
    }

    public func requestForecastWeatherData(location: Location, completion: @escaping (Result<ForecastViewController.Model, ServiceError>) -> ()) {
        setupRequestUrl(location: location, serviceType: .forecast)
        
        guard let url = components.url else { completion(.failure(.wrongUrl)); return }

        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            
            if let error = error { completion(.failure(.requestError(error))) }

            guard let data = data else { completion(.failure(.noData)); return }
            
            let decoder = JSONDecoder()
            do {
                let result: ForecastServiceModel = try decoder.decode(ForecastServiceModel.self, from: data)
                completion(.success(Converter.convert(from: result)))
            } catch {
                completion(.failure(.canNotDecode))
            }
        }).resume()
    }

}

extension Service {
    struct Constants {
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        
        struct ComponentPaths {
            static let basePath = "/data/2.5"
            static let forecast = "/forecast"
            static let weather = "/weather"
        }
        
        struct ParameterKeys {
            static let appId = "appid"
            static let city = "q"
            static let longtitude = "lon"
            static let latitude = "lat"
        }
    }
}

enum ServiceError: Error {
    case requestError(_ error: Error)
    case canNotDecode
    case noData
    case notCompleted
    case wrongUrl
}
