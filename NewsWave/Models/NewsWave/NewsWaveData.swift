//
//  NewsWaveData.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import Foundation

struct NewsWaveData: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: SourceNews
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct SourceNews: Codable {
    let name: String?
}
