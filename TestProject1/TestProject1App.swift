//
//  TestProject1App.swift
//  TestProject1
//
//  Created by Chirag Tailor on 08/02/2024.
//

import SwiftUI

@main
struct TestProject1App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    HomeView()
                        .navigationTitle("Forces")
                }
                .tabItem {
                    Label("Forces", systemImage: "house.fill")
                }
                Text("Map Location")
                .tabItem {
                    Label("Crime location", systemImage: "map")
                }
            }
        }
    }
}
