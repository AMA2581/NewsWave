//
//  HeadlineText.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/20/23.
//

import SwiftUI

struct HeadlineText: View {
    let headline: String
    var body: some View {
        Text(headline)
            .font(.title)
            .foregroundStyle(.accent)
            .padding(20)
    }
}

#Preview {
    HeadlineText(headline: "Test")
}
