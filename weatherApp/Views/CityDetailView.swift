//
//  CityDetailView.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//

import SwiftUI

struct CityDetailView: View {
    let city: City
    let selectedTempOption: String
    @ObservedObject var viewModel: WeatherModel
    @State private var selectedTemperatureOption: TemperatureOptions = .fahrenheit
    var selectedWeather: Welcome {
        if let selectedW = viewModel.weatherCities.first(where: { wel in
            round(wel.latitude) == round(city.latitude)
        }) {
            
            return selectedW
        } else {
            return Welcome.defaultWeather()
        }
    }
    var body: some View {
                    
            VStack {
                
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        
                        Text(city.cityName)
                        HStack {
                            
                            Text("\(String(format: "%.f", selectedWeather.hourly.temperature2M[city.counter]))")
                            Text(selectedTempOption)
                        }
                    }
                    Spacer()
                    Image(city.displayImage).resizable().scaledToFit().frame(width: 30, height: 30)
                }
                
                List(selectedWeather.hourly.time, id: \.self) { cty in
                    //TODO: Need to add the correct columns
                    //Due to lack of time just showing the time for now
                    HStack {
                        Text("\(cty.convertToDate())")
                        Spacer()
                        Text("\(cty.convertToDate())")
                    }
                }
                
            }

    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(city: City(cityName: "New York", latitude: 40.71, longitude: -74.01),selectedTempOption: "C", viewModel: WeatherModel())
    }
}
