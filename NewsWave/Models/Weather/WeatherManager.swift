//
//  WeatherManager.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import Foundation
import CoreLocation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIKeys.weatherKey)"

    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)&units=\(Settings.measurementUnits[0])"
        performRequest(with: urlString)
    }

    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)&units=\(Settings.measurementUnits[0])"
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let wind = decodedData.wind.speed
            let humid = decodedData.main.humidity
            let feelLike = decodedData.main.feels_like
            let pressure = decodedData.main.pressure

            let weather = WeatherModel(conditionId: id, 
                                       cityName: name,
                                       temperature: temp,
                                       wind: wind,
                                       feelLike: feelLike,
                                       humidity: humid,
                                       pressure: pressure)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
