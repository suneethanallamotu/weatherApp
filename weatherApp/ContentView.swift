//
//  ContentView.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherModel()
    @State private var selectedTemperatureOption: TemperatureOptions = .fahrenheit
   
    var selectedWeather: Welcome {
        if let selectedW = viewModel.weatherCities.first(where: { wel in
            round(wel.latitude) > 0
        }) {
            return selectedW
        } else {
            return Welcome.defaultWeather()
        }
    }
    
    var body: some View {
            NavigationView {
                
                VStack {
                    Picker("", selection: $selectedTemperatureOption) {
                        ForEach(TemperatureOptions.allCases, id: \.rawValue) { temperature in
                            Text(temperature.rawValue).tag(temperature)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    switch selectedTemperatureOption {
                        
                    case .celsius:
                        Text("Celsius")
                    case .fahrenheit:
                        Text("Fahrenheight")
                    }
                    
                    
                    List(viewModel.listOfCities) { city in
                        NavigationLink(destination: CityDetailView(city: city,  selectedTempOption: selectedTemperatureOption.rawValue, viewModel: viewModel)) {
                            
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text(city.cityName)
                                    HStack {
                                        
                                        Text("\(String(format: "%.f", selectedWeather.hourly.temperature2M[city.counter]))")
                                        Text(selectedTemperatureOption.rawValue)
                                    }
                                }
                                Spacer()
                                
                                //The format of temp is coming as an array,
                                //so using this logic for now in the interest of time
                                //For now showing an image based on city instead of precipitation
                                //Precipitation is coming in the array and not at the JSON main object level
                                
                                Image(city.displayImage).resizable().scaledToFit().frame(width: 30, height: 30)
                                
                                
                            }
                        }
                    }
                    .navigationTitle("List of Cities")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            
        .task {
            await viewModel.getAllCities()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
