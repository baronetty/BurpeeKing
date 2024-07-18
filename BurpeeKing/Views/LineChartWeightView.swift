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
                RuleMark(y: .value("Goal", exercise.goalWeightOrTime))
                    .foregroundStyle(.red)
                    .lineStyle(StrokeStyle(dash: [15.0, 5.0]))
                //                    .annotation(alignment: .leading) {
                //                        Text("Goal")
                //                            .font(.caption)
                //                            .foregroundStyle(.secondary)
                //                    }
                ForEach(exercises) { exercise in
                    LineMark(x: .value("Date", exercise.date, unit: .month),
                             y: .value("Weight", exercise.weightCountOrTime ?? 0.0))
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

#Preview {
    do {
        let previewer = try Previewer()
        
        return LineChartView(exercise: Exercise(name: "Deadlift", numberOfReps: 2, weightCountOrTime: 170.0, goalWeightOrTime: 200.0, details: "My favorite exercise", date: Date.from(year: 2023, month: 8, day: 5)))
            .modelContainer(previewer.container)
    } catch {
        return Text("🤬 ERROR: Failed to create preview: \(error.localizedDescription)")
    }
}



