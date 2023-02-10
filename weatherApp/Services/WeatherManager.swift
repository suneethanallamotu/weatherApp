//
//  WeatherManager.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//

import Foundation

class WebService {
    //url: https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&hourly=temperature_2m,rain
    static func getByCity(lat: Double, lon: Double) async throws -> Welcome {
        
        let url = URL(string:"https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(lon)&hourly=temperature_2m,rain")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError()
        }
        let welcome = try JSONDecoder().decode(Welcome.self, from: data)
        return welcome
    }
}
