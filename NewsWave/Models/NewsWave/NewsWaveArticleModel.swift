//
//  NewsWaveArticleModel.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/29/23.
//

import Foundation
import SwiftUI

struct NewsWaveArticleModel: Identifiable {
    var id = UUID()
    var source: String
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
}
