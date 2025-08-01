//
//  ContentView.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Stats", systemImage: "books.vertical")
            }
            
            NavigationView {
                CategoryView()
            }
            .tabItem {
                Label("Categories", systemImage: "list.bullet")
            }
        }
        .tint(Color("NothingPrimary"))
    }
}

#Preview {
    ContentView()
}
