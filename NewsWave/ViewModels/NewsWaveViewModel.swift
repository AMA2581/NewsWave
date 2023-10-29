//
//  NewsWaveViewModel.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/29/23.
//

import Foundation

class NewsWaveViewModel: ObservableObject {
    @Published private(set) var source = "source"
    @Published private(set) var author = "author"
    @Published private(set) var title = "title"
    @Published private(set) var description = "description"
    @Published private(set) var url = "url"
    @Published private(set) var urlToImage = ""
    @Published private(set) var publishedAt = "publishedAt"
    @Published private(set) var content = "content"

    var newsWaveManager = NewsWaveManager()

    init() {
        newsWaveManager.delegate = self
    }
    
    func refreshNewsWave() {
        newsWaveManager.fetchTopHeadlines()
    }
}

extension NewsWaveViewModel: NewsWaveManagerDelegate {
    func didUpdateNews(_ newsWaveManager: NewsWaveManager, news: NewsWaveModel) {
        DispatchQueue.main.async {
            self.source = news.articles[0].source ?? "source"
            self.author = news.articles[0].author ?? "author"
            self.title = news.articles[0].title ?? "title"
            self.description = news.articles[0].description ?? "description"
            self.url = news.articles[0].url ?? "url"
            self.urlToImage = news.articles[0].urlToImage ?? ""
            self.publishedAt = news.articles[0].publishedAt ?? "publishedAt"
            self.content = news.articles[0].publishedAt ?? "content"
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}
