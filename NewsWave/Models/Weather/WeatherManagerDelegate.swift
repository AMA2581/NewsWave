//
//  WeatherManagerDelegate.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
