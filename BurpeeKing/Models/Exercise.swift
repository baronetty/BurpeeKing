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
    var timeOrWeight: Bool
    @Attribute(.unique) var name: String
    var numberOfReps: Int? // Picker
    var weightCountOrTime: Double? // y axis
    var goalWeightOrTime: Double // goal line
    var details: String
    var date: Date // x axis
    
    init(timeOrWeight: Bool = true, name: String = "", numberOfReps: Int? = nil, weightCountOrTime: Double? = nil, goalWeightOrTime: Double = 0.0, details: String = "", date: Date = Date.now) {
        self.timeOrWeight = timeOrWeight
        self.name = name
        self.numberOfReps = numberOfReps
        self.weightCountOrTime = weightCountOrTime
        self.goalWeightOrTime = goalWeightOrTime
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
