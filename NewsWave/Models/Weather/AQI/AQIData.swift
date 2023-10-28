//
//  AQIData.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/28/23.
//

import Foundation

struct AQIData: Codable {
    let coord: AQICoord
    let list: [AQIList]
}

// MARK: - Coord
struct AQICoord: Codable {
    let lon, lat: Int
}

// MARK: - List
struct AQIList: Codable {
    let main: AQIMain
    let components: [String: Double]
    let dt: Int
}

// MARK: - Main
struct AQIMain: Codable {
    let aqi: Int
}
