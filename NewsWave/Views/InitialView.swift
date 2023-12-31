//
//  ContentView.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/19/23.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        TabView {
            NewsWaveView()
                .tabItem {
                    Label("NewsWave", systemImage: "newspaper.fill")
                }
            WeatherView()
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    InitialView()
}
