//
//  AQIData.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/28/23.
//

import Foundation

struct AQIData: Codable {
    var list: [AQIList]
}

struct AQIList: Codable {
    var main: AQIMain
}

struct AQIMain: Codable {
    var aqi: Int
}
