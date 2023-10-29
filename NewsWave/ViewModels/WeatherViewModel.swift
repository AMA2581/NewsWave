//
//  WeatherViewModel.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import CoreLocation
import Foundation
import SwiftUI

final class WeatherViewModel: NSObject, ObservableObject {
    @Published private(set) var temprature = 60
    @Published private(set) var location = "City"
    @Published private(set) var statusImage = Image(systemName: "cloud.sun.fill")
    @Published private(set) var aqi = "Good"
    @Published private(set) var uvIndex = "low"
    @Published private(set) var wind = "2.5"
    @Published private(set) var humidity = 0
    @Published private(set) var feelLike = 0
    @Published private(set) var pressure = "25.00"
    @Published private(set) var isLoading = true
    

    let locationManager = CLLocationManager()
    var weatherManager = WeatherManager()
    var aqiManager = AQIManager()

    override init() {
        super.init()
        weatherManager.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func updateWeather() {
        locationManager.requestLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            isLoading = true
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
            aqiManager.fetchAQI(latitude: lat, longitude: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

// MARK: - WeatherManagerDelegate
extension WeatherViewModel: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temprature = weather.temperatureInt
            self.statusImage = Image(systemName: weather.conditionName)
            self.location = weather.cityName
            self.wind = weather.windString
            self.feelLike = weather.feelLikeInt
            self.humidity = weather.humidity
            self.pressure = weather.pressureString
            self.isLoading = false
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}

// MARK: - AQIManagerDelegate
extension WeatherViewModel: AQIManagerDelegate {
    func didUpdateAQI(_ AQIManager: AQIManager, aqi: AQIModel) {
        DispatchQueue.main.async {
            self.aqi = aqi.aqi
        }
    }
}
