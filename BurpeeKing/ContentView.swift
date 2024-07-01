//
//  TabViewView.swift
//  BurpeeKing
//
//  Created by Leo  on 01.07.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Diary", systemImage: "pencil.and.list.clipboard")
                }
            
            InformationView()
                .tabItem {
                    Label("Information", systemImage: "info.square.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
