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
    let source: String?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
