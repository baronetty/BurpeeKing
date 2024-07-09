//
//  TabViewView.swift
//  BurpeeKing
//
//  Created by Leo  on 01.07.24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var exercises: [Exercise]
    
    var body: some View {
//        if exercises.isEmpty {
//            WelcomeView()
//        } else {
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
//        }
    }
}

#Preview {
    ContentView()
}
