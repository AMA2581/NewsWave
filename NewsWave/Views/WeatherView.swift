//
//  WeatherView.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(viewModel.temprature)°F")
                            .font(.system(size: 50, weight: .bold))
                        Text(viewModel.location)
                            .font(.system(size: 35))
                    }
                    Spacer()
                    viewModel.statusImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125, height: 125)
                }
                .padding(50)
                VStack (spacing: 20) {
                    HStack(spacing: 20) {
                        WeatherCard(imageName: "sun.max.fill", text: "UV", variable: viewModel.uvIndex)
                        WeatherCard(imageName: "humidity.fill", text: "humidity", variable: "\(viewModel.humidity)%")
                    }
                    HStack(spacing: 20) {
                        WeatherCard(imageName: "wind", text: "wind", variable: viewModel.wind)
                        WeatherCard(imageName: "air.purifier.fill", text: "AQI", variable: "\(viewModel.aqi)")
                    }
                }
            }
            .background(LinearGradient(colors: [.dayColor1, .dayColor2],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
        }
        .onAppear(perform: {
            viewModel.updateWeather()
        })
    }
}

#Preview {
    WeatherView()
}
