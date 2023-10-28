//
//  AQIModel.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/28/23.
//

import Foundation

struct AQIModel {
    let aqiNum: Int
    var aqi: String {
        switch aqiNum {
        case 1:
            "Good"
        case 2:
            "Fair"
        case 3:
            "Moderate"
        case 4:
            "Poor"
        case 5:
            "Very Poor"
        default:
            "Out of range"
        }
    }
}
