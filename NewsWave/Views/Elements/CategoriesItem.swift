//
//  CategoriesItem.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/20/23.
//

import SwiftUI

struct CategoriesItem: View {
    var body: some View {
        HStack (spacing: 35) {
            Image(.defaultNewsCardBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 5) {
                Text("Title")
                    .font(.system(size: 30))
            }
            Rectangle()
                .fill()
                .frame(width: 125, height: 50)
                .foregroundColor(.clear)
        }
    }
}

#Preview {
    CategoriesItem()
}
