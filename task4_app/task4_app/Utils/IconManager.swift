//
//  IconManager.swift
//  task4_app
//
//  Created by Erkam Karaca on 29.08.2023.
//

import Foundation

func systemImageName(for weatherCondition: String) -> String {
    let lowercaseCondition = weatherCondition.lowercased()

    switch lowercaseCondition {
    case "clear":
        return "sun.max"
    case "clouds":
        return "cloud"
    case "rain":
        return "cloud.rain"
    case "thunderstorm":
        return "cloud.bolt"
    case "snow":
        return "snow"
    case "mist":
        return "cloud.fog"
    default:
        return "questionmark"
    }
}

