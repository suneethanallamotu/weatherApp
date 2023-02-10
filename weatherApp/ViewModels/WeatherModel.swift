//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//

import Foundation
@MainActor class WeatherModel: ObservableObject {
    @Published var  weatherCities: [Welcome] = []
    //let listOfCities: [String: [Double: Double]] = ["New York": [40.71: -74.01], "Dallas": [32.78: -96.81], "Miami": [25.77: -80.19]]
    //let listOfCities: [Double: Double] = [[40.71: -74.01], [32.78: -96.81],  [25.77: -80.19]]
    @Published var listOfCities: [City] = []
    //let client = WebService()
    init(){
        initializeCities()
        //getAllCities()
    }
    
    func initializeCities() {
        listOfCities.append(City(cityName: "New York", latitude: 40.71, longitude: -74.01))
        listOfCities.append(City(cityName: "Dallas", latitude: 32.78, longitude: -96.81))
        listOfCities.append(City(cityName: "Miami", latitude: 25.77, longitude: -80.19))
    }
    
    func getAllCities() async {
        
        
        for selectedCity in listOfCities {
            do {
                let singleCity = try await WebService.getByCity(lat: selectedCity.latitude, lon: selectedCity.longitude)
                weatherCities.append(singleCity)
            } catch {
                print("error getting weather data. Error is: \(error.localizedDescription)")
            }
        }
        
        
    }
    
}
