//
//  NewsWaveManagerDelegate.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/29/23.
//

import Foundation

protocol NewsWaveManagerDelegate {
    func didUpdateNews(_ newsWaveManager: NewsWaveManager, news: NewsWaveModel)
    func didFailWithError(error: Error)
}
