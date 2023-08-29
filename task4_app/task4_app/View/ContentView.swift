//
//  ContentView.swift
//  task4_app
//
//  Created by Erkam Karaca on 29.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State var city: City?
    @State var cityName: String = Constants.placeholderCityName
    @State var weatherCondition: String = Constants.placeholderWeatherDescription
    @State var degree: String = ""
    @State var maxDegree: String = ""
    @State var minDegree: String = ""
    
    
    var body: some View {
        VStack(spacing: 20) {
            if let lat = locationManager.latitude, let lon = locationManager.longitude {
                Text(cityName).font(.title).padding(.init(top: 50, leading: 0, bottom: 0, trailing: 0))
                Image(systemName: weatherCondition).font(.title)
                Text("\(degree) \u{00B0}C")
                HStack {
                    Text("Max: \(maxDegree)\u{00B0}C")
                    Text("Min: \(minDegree)\u{00B0}C")
                }
                .onAppear {
                    if let weatherURL = NetworkManager.shared.getWeatherURL(lat: "\(lat)", lon: "\(lon)") {
                        fetchData(from: weatherURL, expecting: City.self) { result in
                            switch result {
                            case .success(let city):
                                DispatchQueue.main.async {
                                    self.city = city
                                    configureView(city: city)
                                }
                            case .failure(let error):
                                print(MyError.DATA_ERROR + " \(error)")
                            }
                        }
                    }
                }
            } else {
                Spacer()
                Text(MyError.PERMISSON_ERROR)
            }
            Spacer()
        }
        .onAppear {
            locationManager.requestLocation()
        }
    }
    
    func configureView(city: City) {
        self.cityName = city.name ?? Constants.placeholderCityName
        self.minDegree = "\(city.main?.tempMin ?? Constants.placeholderTemperature)"
        self.maxDegree = "\(city.main?.tempMax ?? Constants.placeholderTemperature)"
        self.degree = "\(city.main?.temp ?? Constants.placeholderTemperature)"
        self.weatherCondition = city.weather?[0].main ?? Constants.placeholderWeatherDescription
        self.weatherCondition = systemImageName(for: weatherCondition) // Selecting icon for weather type.
    }
}

