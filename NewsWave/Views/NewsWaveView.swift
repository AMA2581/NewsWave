//
//  NewsWave.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import SwiftUI

struct NewsWaveView: View {
    @StateObject var viewModel = NewsWaveViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HeadlineText(headline: "Headlines")
                    ScrollView(.horizontal) {
                        HStack(alignment: .top, spacing: 25) {
                            if viewModel.isLoaded {
                                ForEach(1...5, id: \.self) { index in
                                    NewsCard(urlToImage: $viewModel.newsWaveArticleModel[index].urlToImage,
                                             title: $viewModel.newsWaveArticleModel[index].title,
                                             source: $viewModel.newsWaveArticleModel[index].source)
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                }
                VStack(alignment: .leading) {
                    HeadlineText(headline: "Categories")
                    ScrollView(.horizontal) {
                        HStack(spacing: 40) {
                            VStack {
                                CategoriesItem()
                                Divider()
                                CategoriesItem()
                                Divider()
                                CategoriesItem()
                            }
                            VStack {
                                CategoriesItem()
                                Divider()
                                CategoriesItem()
                                Divider()
                                CategoriesItem()
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                }
            }
            .navigationTitle("NewsWave")
        }
        .onAppear(perform: {
            viewModel.refreshNewsWave()
        })
    }
}

#Preview {
    NewsWaveView()
}
