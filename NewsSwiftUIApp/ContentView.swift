//
//  ContentView.swift
//  NewsSwiftUIApp
//
//  Created by eidd5180 on 27/10/2021.
//

import SwiftUI

// We use news api

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
