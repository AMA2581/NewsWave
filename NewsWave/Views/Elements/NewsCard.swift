//
//  NewsCard.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/19/23.
//

import SwiftUI

struct NewsCard: View {
    var body: some View {
        VStack (alignment: .leading) {
            Image(.defaultNewsCardBackground)
                .resizable()
                .frame(width: 300, height: 250)
                .aspectRatio(contentMode: .fill)
            VStack (alignment: .leading, spacing: 6 ) {
                Text("Source")
                    .font(.system(size: 18, weight: .regular))
                Text("Title")
                    .font(.system(size: 30, weight: .bold))
                    .lineLimit(3)
            }
            .padding(15)
        }
        .background(.thickMaterial)
        .cornerRadius(20)
    }
}

#Preview {
    NewsCard()
}
