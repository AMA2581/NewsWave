//
//  WeatherModel.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let wind: Double
    let feelLike: Double
    let humidity: Int
    let pressure: Int
    
    var windString: String {
        return String(format: "%.1f", wind)
    }
    
    var temperatureInt: Int {
        return Int(temperature)
    }
    
    var feelLikeInt: Int {
        return Int(feelLike)
    }
    
    private var pressureINHG: Double {
        return Double(pressure) * 0.02953
    }
    
    private var pressureMMHG: Double {
        return Double(pressure) * 0.75006
    }
    
    var pressureString: String {
        return String(format: "%.2f", Settings.measurementUnits[0] == "imperial" ? pressureINHG : pressureMMHG)
    }

    var conditionName: String {
        switch conditionId {
        case 200 ... 232:
            return "cloud.bolt.rain.fill"
        case 300 ... 321:
            return "cloud.drizzle.fill"
        case 500 ... 531:
            return "cloud.rain.fill"
        case 600 ... 622:
            return "cloud.snow.fill"
        case 711:
            return "smoke.fill"
        case 721:
            return "sun.haze.fill"
        case 731, 761, 751, 762:
            return "sun.dust.fill"
        case 741, 701:
            return "cloud.fog.fill"
        case 781:
            return "tornado"
        case 800:
            return "sun.max.fill"
        case 801 ... 802:
            return "cloud.sun.fill"
        case 803 ... 804:
            return "cloud.fill"
        default:
            return "sun.max.fill"
        }
    }
}
