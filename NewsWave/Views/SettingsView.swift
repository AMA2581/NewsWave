//
//  SettingsView.swift
//  NewsWave
//
//  Created by Amir Mahdi Abravesh on 10/21/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("NewsWave") {
                    Text("NewsWave Settings")
                }
                Section("Weather") {
                    Picker(selection:  .constant(1), label: Text("Units")) {
                        Text("Imperial").tag(1)
                        Text("Meteric").tag(2)
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
