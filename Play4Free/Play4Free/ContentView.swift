//
//  ContentView.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 26.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                            .foregroundColor(.accentColor)
                        Text("Home")
                    }
                    .toolbarBackground(Color.darkgray, for: .tabBar)
            }
            .accentColor(.orange)
    }
}

#Preview {
    ContentView()
}
