//
//  Connectivity.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 06.09.21.
//

import Alamofire

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet: Bool { self.sharedInstance.isReachable }
}
