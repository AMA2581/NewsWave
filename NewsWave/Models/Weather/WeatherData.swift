//
//  WeatherData.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: WMain
    let wind: Wind
    let weather: [Weather]
}

struct WMain: Codable {
    let temp: Double
    let feels_like: Double
    let humidity: Int
    let pressure: Int
}

struct Weather: Codable {
    let id: Int
}

struct Wind: Codable {
    let speed: Double
}
