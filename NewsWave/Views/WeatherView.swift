//
//  WeatherView.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack {
                        Text("50°F")
                    }
                }
            }
        }
    }
}

#Preview {
    WeatherView()
}
