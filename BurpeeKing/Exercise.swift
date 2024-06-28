//
//  Exercise.swift
//  BurpeeKing
//
//  Created by Leo  on 15.01.24.
//

import Foundation
import SwiftData

@Model
class Exercise: ObservableObject, Identifiable, Equatable {
    var name: String
    var numberOfReps: Int // Picker
    var weightCount: Double // y axis
    var details: String
    var date: Date // x axis
    
    init(name: String, numberOfReps: Int, weightCount: Double, details: String, date: Date) {
        self.name = name
        self.numberOfReps = numberOfReps
        self.weightCount = weightCount
        self.details = details
        self.date = date
    }
}

func == (lhs: Exercise, rhs: Exercise) -> Bool {
        lhs.id == rhs.id
    }

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
