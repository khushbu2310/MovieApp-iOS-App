//
//  StringExtension.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

extension String {
    
    func covertDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "MM/dd/yy"
            dateFormatter.locale = Locale(identifier: "en_US")
            return dateFormatter.string(from: date)
        } else {
            return "11/3/23"
        }
    }
    
    func convertMinutesToHourMinutes(minutes: Int) -> String {
        let hrs = minutes/60
        let mins = minutes%60
        let formattedTime = String(format: "%02d:%02d", hrs, mins)
        return formattedTime
    }
}
