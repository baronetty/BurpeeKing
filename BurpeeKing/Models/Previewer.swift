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
    var exercise: Exercise
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Exercise.self, configurations: config)
        
        exercise = Exercise(timeOrWeight: false, name: "Deadlift", numberOfReps: 2, weightCountOrTime: 190.0, goalWeightOrTime: 200.0, details: "My favorite exercise", date: Date.from(year: 2023, month: 8, day: 5))
        container.mainContext.insert(exercise)
        
        exercise = Exercise(timeOrWeight: false, name: "Squats", numberOfReps: 3, weightCountOrTime: 150.0, goalWeightOrTime: 180.0, details: "Leg day", date: Date.from(year: 2023, month: 8, day: 6))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Bench Press", numberOfReps: 4, weightCountOrTime: 100.0, goalWeightOrTime: 120.0, details: "Chest workout", date: Date.from(year: 2023, month: 8, day: 7))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Pull-Ups", numberOfReps: 10, weightCountOrTime: 0.0, goalWeightOrTime: 0.0, details: "Back and arms", date: Date.from(year: 2023, month: 8, day: 8))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Push-Ups", numberOfReps: 20, weightCountOrTime: 0.0, goalWeightOrTime: 0.0, details: "Bodyweight exercise", date: Date.from(year: 2023, month: 8, day: 9))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Lunges", numberOfReps: 15, weightCountOrTime: 50.0, goalWeightOrTime: 60.0, details: "Leg workout", date: Date.from(year: 2023, month: 8, day: 10))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Bicep Curls", numberOfReps: 12, weightCountOrTime: 30.0, goalWeightOrTime: 35.0, details: "Arm day", date: Date.from(year: 2023, month: 8, day: 11))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Tricep Extensions", numberOfReps: 12, weightCountOrTime: 25.0, goalWeightOrTime: 30.0, details: "Arm day", date: Date.from(year: 2023, month: 8, day: 12))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Leg Press", numberOfReps: 5, weightCountOrTime: 200.0, goalWeightOrTime: 250.0, details: "Leg day", date: Date.from(year: 2023, month: 8, day: 13))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Calf Raises", numberOfReps: 20, weightCountOrTime: 70.0, goalWeightOrTime: 80.0, details: "Leg day", date: Date.from(year: 2023, month: 8, day: 14))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Shoulder Press", numberOfReps: 8, weightCountOrTime: 40.0, goalWeightOrTime: 50.0, details: "Shoulder workout", date: Date.from(year: 2023, month: 8, day: 15))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Lat Pulldowns", numberOfReps: 10, weightCountOrTime: 60.0, goalWeightOrTime: 70.0, details: "Back workout", date: Date.from(year: 2023, month: 8, day: 16))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Dumbbell Rows", numberOfReps: 8, weightCountOrTime: 50.0, goalWeightOrTime: 60.0, details: "Back workout", date: Date.from(year: 2023, month: 8, day: 17))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Chest Flys", numberOfReps: 12, weightCountOrTime: 25.0, goalWeightOrTime: 30.0, details: "Chest workout", date: Date.from(year: 2023, month: 8, day: 18))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Planks", numberOfReps: 1, weightCountOrTime: 0.0, goalWeightOrTime: 0.0, details: "Core exercise", date: Date.from(year: 2023, month: 8, day: 19))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Russian Twists", numberOfReps: 30, weightCountOrTime: 10.0, goalWeightOrTime: 15.0, details: "Core exercise", date: Date.from(year: 2023, month: 8, day: 20))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Sit-Ups", numberOfReps: 25, weightCountOrTime: 0.0, goalWeightOrTime: 0.0, details: "Core exercise", date: Date.from(year: 2023, month: 8, day: 21))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Leg Raises", numberOfReps: 15, weightCountOrTime: 0.0, goalWeightOrTime: 0.0, details: "Core exercise", date: Date.from(year: 2023, month: 8, day: 22))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Bicycle Crunches", numberOfReps: 30, weightCountOrTime: 0.0, goalWeightOrTime: 0.0, details: "Core exercise", date: Date.from(year: 2023, month: 8, day: 23))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Mountain Climbers", numberOfReps: 40, weightCountOrTime: 0.0, goalWeightOrTime: 0.0, details: "Cardio", date: Date.from(year: 2023, month: 8, day: 24))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Run 5k", numberOfReps: 1, weightCountOrTime: 24.03, goalWeightOrTime: 20.0, details: "Morning run", date: Date.from(year: 2023, month: 8, day: 25))
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: false, name: "Run 10k", numberOfReps: 1, weightCountOrTime: 50.25, goalWeightOrTime: 45.0, details: "Evening run", date: Date.from(year: 2023, month: 8, day: 26))
        container.mainContext.insert(exercise)
        
        exercise = Exercise(timeOrWeight: true, name: "5K run", numberOfReps: nil, weightCountOrTime: 24.0, goalWeightOrTime: 20.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "10K run", numberOfReps: nil, weightCountOrTime: 50.0, goalWeightOrTime: 45.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Half Marathon", numberOfReps: nil, weightCountOrTime: 120.0, goalWeightOrTime: 110.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Full Marathon", numberOfReps: nil, weightCountOrTime: 240.0, goalWeightOrTime: 220.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Sprint 100m", numberOfReps: nil, weightCountOrTime: 12.0, goalWeightOrTime: 10.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Sprint 200m", numberOfReps: nil, weightCountOrTime: 25.0, goalWeightOrTime: 22.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "1 Mile run", numberOfReps: nil, weightCountOrTime: 8.0, goalWeightOrTime: 7.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Swimming 500m", numberOfReps: nil, weightCountOrTime: 15.0, goalWeightOrTime: 13.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Swimming 1k", numberOfReps: nil, weightCountOrTime: 30.0, goalWeightOrTime: 27.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Cycling 10k", numberOfReps: nil, weightCountOrTime: 40.0, goalWeightOrTime: 35.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Cycling 20k", numberOfReps: nil, weightCountOrTime: 80.0, goalWeightOrTime: 75.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Rowing 2k", numberOfReps: nil, weightCountOrTime: 10.0, goalWeightOrTime: 9.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Rowing 5k", numberOfReps: nil, weightCountOrTime: 25.0, goalWeightOrTime: 22.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Rowing 10k", numberOfReps: nil, weightCountOrTime: 50.0, goalWeightOrTime: 45.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Elliptical 30 min", numberOfReps: nil, weightCountOrTime: 30.0, goalWeightOrTime: 27.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Elliptical 1 hour", numberOfReps: nil, weightCountOrTime: 60.0, goalWeightOrTime: 55.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Hiking 5k", numberOfReps: nil, weightCountOrTime: 45.0, goalWeightOrTime: 40.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Hiking 10k", numberOfReps: nil, weightCountOrTime: 90.0, goalWeightOrTime: 80.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Walking 30 min", numberOfReps: nil, weightCountOrTime: 30.0, goalWeightOrTime: 27.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

        exercise = Exercise(timeOrWeight: true, name: "Walking 1 hour", numberOfReps: nil, weightCountOrTime: 60.0, goalWeightOrTime: 55.0, details: "", date: Date.now)
        container.mainContext.insert(exercise)

    }
}
