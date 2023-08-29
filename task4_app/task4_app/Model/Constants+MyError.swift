//
//  Constanst+MyError.swift
//  task4_app
//
//  Created by Erkam Karaca on 29.08.2023.
//

import Foundation

struct Constants {
    static let placeholderCityName = "No city info."
    static let placeholderTemperature = Float(-999.9)
    static let placeholderHumidity = "No humidity info."
    static let placeholderSpeed = "No speed info."
    static let placeholderGust = "No gust info."
    static let placeholderSeaLevel = "No sea level info."
    static let placeholderLon = "No longitude info."
    static let placeholderLat = "No latitude info."
    static let placeholderWeatherDescription = "No weather description info."
}

struct MyError {
    static let URL_ERROR = "ERROR: Cannot create URL."
    static let DATA_ERROR = "ERROR: Cannot get Data."
    static let JSON_FILE_NOT_FOUND_ERROR = "JSON file not found."
}
