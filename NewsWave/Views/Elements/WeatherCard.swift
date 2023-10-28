//
//  SwiftUIView.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/27/23.
//

import SwiftUI

struct WeatherCard: View {
    let imageName: String
    let text: String
    var variable: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(text)
                .font(.system(size: 30, weight: .semibold))
            Text(variable)
                .font(.system(size: 25))
        }
        .frame(width: 160)
//        .padding(.horizontal, 50)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .cornerRadius(25)
    }
}

#Preview {
    WeatherCard(imageName: "sun.max.fill", text: "some", variable: "some")
}
