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
    @State private var tabSelection = 1
    
    var body: some View {
        if exercises.isEmpty {
            WelcomeView()
        } else {
            TabView(selection: $tabSelection) {
                MainView()
                    .tabItem {
                        Label("Diary", systemImage: "pencil.and.list.clipboard")
                    }
                    .tag(1)
                
                InformationView()
                    .tabItem {
                        Label("Information", systemImage: "info.square.fill")
                    }
                    .tag(2)
            }
            .overlay(alignment: .bottom) {
                CustomTabView(tabSelection: $tabSelection)
            }
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return ContentView()
            .modelContainer(previewer.container)
    } catch {
        return Text("🤬 ERROR: Failed to create preview: \(error.localizedDescription)")
    }
}
