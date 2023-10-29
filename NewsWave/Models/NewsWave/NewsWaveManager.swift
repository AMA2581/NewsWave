//
//  NewsWaveManager.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import Foundation

struct NewsWaveManager {
    let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(APIKeys.NewsWaveKey)"

    var delegate: NewsWaveManagerDelegate?

    func fetchTopHeadlines() {
        performRequest(with: newsURL)
    }

    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let news = self.parseJSON(safeData) {
                        self.delegate?.didUpdateNews(self, news: news)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ newsWaveData: Data) -> NewsWaveModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NewsWaveData.self, from: newsWaveData)
            var newsWaveModel: NewsWaveModel!
            for article in decodedData.articles {
                let source = article.source.name
                let author = article.author
                let title = article.author
                let description = article.description
                let url = article.url
                let urlToImage = article.urlToImage
                let publishedAt = article.publishedAt
                let content = article.content
                
                let tempArticle = NewsWaveArticleModel(source: source ?? "",
                                                       author: author ?? "",
                                                       title: title ?? "",
                                                       description: description ?? "",
                                                       url: url ?? "",
                                                       urlToImage: urlToImage ?? "",
                                                       publishedAt: publishedAt ?? "",
                                                       content: content ?? "")
                if newsWaveModel == nil {
                    newsWaveModel = NewsWaveModel(articles: [tempArticle])
                } else {
                    newsWaveModel.articles.append(tempArticle)
                }
            }
            return newsWaveModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
