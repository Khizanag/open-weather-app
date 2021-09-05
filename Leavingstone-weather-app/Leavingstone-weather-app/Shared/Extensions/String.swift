//
//  String+Extension.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

extension String {
    func substring(with r: Range<Int>) -> String {
        let startIndex = self.startIndex
        let L = self.index(startIndex, offsetBy: r.lowerBound)
        let R = self.index(startIndex, offsetBy: r.upperBound)
        return String(self[L..<R])
    }
}
