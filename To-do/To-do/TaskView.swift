//
//  TabView.swift
//  To-do
//
//  Created by Jakob Padtberg on 26.10.23.
//

import SwiftUI
import Foundation

struct TaskView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "person")
                }
            SecondView()
                .tabItem {
                    Image(systemName: "book")
                }
            
        }
    }
}
        
struct MainView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { i in
                Text("\(i)")
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        Text("2. View")
    }
}

#Preview {
    ContentView()
}
