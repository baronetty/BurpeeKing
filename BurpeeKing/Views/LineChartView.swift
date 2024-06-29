//
//  LineChartView.swift
//  BurpeeKing
//
//  Created by Leo  on 14.01.24.
//

import Charts
import SwiftData
import SwiftUI

struct LineChartView: View {
    @Query var exercises: [Exercise]
    let exercise: Exercise

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(exercise.name) Overview")
                .font(.headline)
                .bold()
//            Text("Max Weight: \(exerciseManager.highestWeightCount, specifier: "%.1f")kg")
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
            
            Chart {
                RuleMark(y: .value("Goal", 200))
                    .foregroundStyle(.red)
                    .lineStyle(StrokeStyle(dash: [15.0, 5.0]))
                //                    .annotation(alignment: .leading) {
                //                        Text("Goal")
                //                            .font(.caption)
                //                            .foregroundStyle(.secondary)
                //                    }
                ForEach(exercises) { exercise in
                    LineMark(x: .value("Date", exercise.date, unit: .month),
                             y: .value("Weight", exercise.weightCount ?? 0.0))
                    .foregroundStyle(.blue.gradient)
                }
            }
            .frame(height: 250)
            .chartYScale(domain: 100...250)
            //            .chartXAxis {
            //                AxisMarks(values: exercises.map {$0.date}) { date in
            //                    AxisValueLabel(format: .dateTime.month(.narrow), centered: true)
            //                }
            //            }
            //            .chartPlotStyle { plotContent in
            //                plotContent
            //                    .background(.black.gradient.opacity(0.3))
            //            }
            
            
            Text("---")
                .foregroundStyle(.red)
            + Text("  Goal")
                .font(.callout)
            
        }
        .padding()
    }
}

//#Preview {
//    LineChartView(exercise: Exercise(name: "", numberOfReps: 0, weightCount: 0.0, details: "", date: Date.now))
//        .modelContainer(for: Exercise.self, inMemory: true)
//}



