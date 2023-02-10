//
//  Weather.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//


import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let hourlyUnits: HourlyUnits
    let hourly: Hourly

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case hourlyUnits = "hourly_units"
        case hourly
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]
    let temperature2M, rain: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case rain
    }
}

// MARK: - HourlyUnits
struct HourlyUnits: Codable {
    let time, temperature2M, rain: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case rain
    }
}

extension Welcome {
    static func defaultWeather() -> Welcome {
        
        let welcome = Welcome(latitude: 40.710335, longitude: -73.99307, generationtimeMS: 0.300, utcOffsetSeconds: 0, timezone: "GMT", timezoneAbbreviation: "GMT", elevation: 27, hourlyUnits: HourlyUnits(time: "iso8601", temperature2M: "C", rain: "mm"), hourly: Hourly(time: ["2023-02-09T00:00"], temperature2M: [8.2, 7.5], rain: [0,0.1]))
        
        return welcome

    }
}
