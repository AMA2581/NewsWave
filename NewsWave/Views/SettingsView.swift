//
//  SettingsView.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @State var tag = Settings.measurementUnits
    
    var body: some View {
        NavigationStack {
            List {
                Section("NewsWave") {
                    Text("NewsWave Settings")
                }
                Section("Weather") {
                    Picker(selection: $tag, 
                           label: Text("Units")) {
                        Text("Imperial").tag("imperial")
                        Text("Meteric").tag("meteric")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
