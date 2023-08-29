//
//  LocationManager.swift
//  task4_app
//
//  Created by Erkam Karaca on 29.08.2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    @Published var latitude: Double?
    @Published var longitude: Double?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func getCoordinates(completion: @escaping (String, String) -> Void) {
        if let lat = latitude, let lon = longitude {
            completion("\(lat)", "\(lon)")
        } else {
            print("Lati Lon are nil")
        }
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude

            // Call getCoordinates here, after the location updates
            self.getCoordinates { lat, lon in
                let weatherURL = NetworkManager.shared.getWeatherURL(lat: "\(lat)", lon: "\(lon)")
                print(weatherURL ?? "")
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}
