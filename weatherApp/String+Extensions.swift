//
//  String+Extensions.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//

import Foundation
import CoreLocation

extension String {
    func convertToDate() -> String {
     
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withColonSeparatorInTime]
        if let formattedString = isoDateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: formattedString)

        }
        
        return "NA"
        

    }
    
    func convertToTime() -> String {
     
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "en_US_POSIX")
        timeFormatter.timeZone = TimeZone(identifier: "GMT") //"HH:mm:ss" // "18:30:00"
        timeFormatter.dateFormat = "HH:mm:ss" //24 hr for HH, 12 hr for hh
        
        if let dt = timeFormatter.date(from: self) {
            timeFormatter.dateFormat = "hh:mm a" //out formatter
            let formatedStringTime = timeFormatter.string(from: dt)
            print(formatedStringTime)
                return formatedStringTime
        }
      
     
        return "12:00 AM"
    }
    
    func getTimeFor(timeStamp: Int) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh a"
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
}
