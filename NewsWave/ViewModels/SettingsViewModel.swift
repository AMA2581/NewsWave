//
//  SettingsViewModel.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/28/23.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    @Published private(set) var measurementUnit = Settings.measurementUnits[0]
    
    
}
