//
//  TimeManager.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import Foundation

class TimeManager {
    static func getWeekday(timeIntervalSince1970: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeIntervalSince1970)
        let f = DateFormatter()
        let weekday = f.weekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
        return weekday
    }
}
