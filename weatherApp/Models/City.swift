//
//  City.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//

import Foundation

struct City: Identifiable {
    var id = UUID()
    var cityName: String
    var latitude: Double
    var longitude: Double
    
}

extension City {
    var displayImage: String {
        
        if (self.cityName == "New York") {
            return "light-rain"
        } else if (self.cityName == "Dallas") {
            return "heavy-rain"
        } else {
            return "sunny"
        }
        
    }
    
    var counter: Int {
        if (self.cityName == "New York") {
            return 0
        } else if (self.cityName == "Dallas") {
            return 1
        } else {
            return 0
        }
    }
}

enum TemperatureOptions: String, CaseIterable {
    case fahrenheit = "F"
    case celsius = "C"
}
