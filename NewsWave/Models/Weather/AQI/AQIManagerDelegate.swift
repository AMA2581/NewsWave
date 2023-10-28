//
//  AQIManagerDelegate.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/28/23.
//

import Foundation

protocol AQIManagerDelegate {
    func didUpdateAQI(_ AQIManager: AQIManager, aqi: AQIModel)
    func didFailWithError(error: Error)
}
