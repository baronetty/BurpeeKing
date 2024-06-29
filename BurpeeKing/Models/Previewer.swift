//
//  Previewer.swift
//  BurpeeKing
//
//  Created by Leo  on 15.01.24.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let exercise: Exercise
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Exercise.self, configurations: config)

        exercise = Exercise(name: "Deadlift", numberOfReps: 2, weightCount: 190.0, details: "My favorit exercise", date: Date.from(year: 2023, month: 8, day: 5))

        container.mainContext.insert(exercise)
    }
}
