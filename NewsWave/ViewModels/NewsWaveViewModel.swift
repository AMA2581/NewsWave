//
//  NewsWaveViewModel.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/29/23.
//

import Foundation

class NewsWaveViewModel: ObservableObject {
    var source = "source"
    var author = "author"
    var title = "title"
    var description = "description"
    var url = "url"
    var urlToImage = ""
    var publishedAt = "publishedAt"
    var content = "content"
    var id = UUID()
    @Published var isLoaded = false
    @Published var newsWaveArticleModel: [NewsWaveArticleModel] = [NewsWaveArticleModel(source: "source",
                                                                                        author: "author",
                                                                                        title: "title",
                                                                                        description: "description",
                                                                                        url: "url",
                                                                                        urlToImage: "",
                                                                                        publishedAt: "publishedAt",
                                                                                        content: "content")]
    var index = 1

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
            for article in news.articles {
                self.source = article.source
                self.author = article.author
                self.title = article.title
                self.description = article.description
                self.url = article.url
                self.urlToImage = article.urlToImage
                self.publishedAt = article.publishedAt
                self.content = article.publishedAt
                self.id = article.id
                self.newsWaveArticleModel.append(NewsWaveArticleModel(id: self.id,
                                                                      source: self.source,
                                                                      author: self.author,
                                                                      title: self.title,
                                                                      description: self.description,
                                                                      url: self.url,
                                                                      urlToImage: self.urlToImage,
                                                                      publishedAt: self.publishedAt,
                                                                      content: self.content))
            }
            self.newsWaveArticleModel.remove(at: 0)
            self.isLoaded = true
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}

// class Article {
//    var source = "source"
//    var author = "author"
//    var title = "title"
//    var description = "description"
//    var url = "url"
//    var urlToImage = ""
//    var publishedAt = "publishedAt"
//    var content = "content"
//    var id = UUID(uuidString: "")
// }
