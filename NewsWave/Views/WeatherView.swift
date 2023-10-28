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
                        Text(Settings.measurementUnit == "imperial" ? "\(viewModel.temprature)°F" : "\(viewModel.temprature)°C")
                            .font(.system(size: 50, weight: .bold))
                        Text(viewModel.location)
                            .font(.system(size: 35))
                    }
                    Spacer()
                    viewModel.statusImage
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125, height: 125)
                }
                .padding(50)
                VStack (spacing: 20) {
                    HStack(spacing: 20) {
                        WeatherCard(imageName: "gauge.with.dots.needle.33percent", text: "Pressure", variable: viewModel.pressure)
                        WeatherCard(imageName: "humidity.fill", text: "Humidity", variable: "\(viewModel.humidity)%")
                    }
                    HStack(spacing: 20) {
                        WeatherCard(imageName: "wind", text: "Wind", variable: viewModel.wind)
                        WeatherCard(imageName: "air.purifier.fill", text: "AQI", variable: "\(viewModel.aqi)")
                    }
                }
            }
            .background(LinearGradient(colors: [.skyColor1, .skyColor2],
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
