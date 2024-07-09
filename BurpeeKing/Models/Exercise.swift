//
//  Exercise.swift
//  BurpeeKing
//
//  Created by Leo  on 15.01.24.
//

import Foundation
import SwiftData

@Model
class Exercise {
    var name: String
    var numberOfReps: Int // Picker
    var weightCount: Double? // y axis
    var goalWeight: Double // goal line
    var details: String
    var date: Date // x axis
    
    init(name: String = "", numberOfReps: Int = 2, weightCount: Double? = nil, goalWeight: Double = 0.0, details: String = "", date: Date = Date.now) {
        self.name = name
        self.numberOfReps = numberOfReps
        self.weightCount = weightCount
        self.goalWeight = goalWeight
        self.details = details
        self.date = date
    }
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
