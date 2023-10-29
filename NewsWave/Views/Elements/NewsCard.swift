//
//  NewsCard.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/19/23.
//

import SwiftUI

struct NewsCard: View {
    @Binding var urlToImage: String
    @Binding var title: String
    @Binding var source: String
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: urlToImage), content: { image in
                image
                    .resizable()
                    .frame(width: 300, height: 250)
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                ZStack {
                    Image(.defaultNewsCardBackground)
                        .resizable()
                        .frame(width: 300, height: 250)
                        .aspectRatio(contentMode: .fit)
                    ProgressView()
                }
            })

            VStack(alignment: .leading, spacing: 6) {
                Text(source)
                    .font(.system(size: 18, weight: .regular))
                Text(title)
                    .font(.system(size: 30, weight: .bold))
                    .lineLimit(3)
            }
            
            .padding(15)
        }
        .frame(width: 300)
        .background(.thickMaterial)
        .cornerRadius(20)
    }
}

//#Preview {
//    NewsCard($urlToImage: "https://picsum.photos/400", $title: "Title", $source: "Source")
//}
