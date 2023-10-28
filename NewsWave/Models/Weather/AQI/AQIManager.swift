//
//  AQIManager.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/27/23.
//

import CoreLocation
import Foundation

struct AQIManager {
    let aqiURL = "https://api.openweathermap.org/data/2.5/air_pollution?appid=\(APIKeys.weatherKey)"

    var delegate: AQIManagerDelegate?

    func fetchAQI(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(aqiURL)&lat=\(latitude)&lon=\(longitude)"
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
                    if let aqi = self.parseJSON(safeData) {
                        self.delegate?.didUpdateAQI(self, aqi: aqi)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ weatherData: Data) -> AQIModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(AQIData.self, from: weatherData)
            let aqi = decodedData.list[0].main.aqi

            let aqiModel = AQIModel(aqiNum: aqi)
            return aqiModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
