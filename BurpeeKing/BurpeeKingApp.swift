//
//  BurpeeKingApp.swift
//  BurpeeKing
//
//  Created by Leo  on 01.11.23.
//

import SwiftData
import SwiftUI

@main
struct BurpeeKingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Exercise.self)
        }
    }
}
