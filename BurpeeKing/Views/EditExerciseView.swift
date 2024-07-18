//
//  EditExerciseView.swift
//  BurpeeKing
//
//  Created by Leo  on 15.01.24.
//

import SwiftUI

struct EditExerciseView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var exercise: Exercise
    @Binding var path: NavigationPath
    
    @State private var weightOrTimeText: String = ""
    @State private var goalText: String = ""
    
        static func setupAppearance() {
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.purple
            
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.systemBackground
            ]
            UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        }
        
        
        init(exercise: Exercise, path: Binding<NavigationPath>) {
            self._exercise = Bindable(exercise)
            self._path = path
            EditExerciseView.setupAppearance()
        }
    
    var body: some View {
        LineChartView(exercise: exercise)
        
        Form {
            Section("What do you want to meassure?") {
                Picker("Time or Weight?", selection: $exercise.timeOrWeight) {
                    Text("Time").tag(true)
                    Text("Weight").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section("Enter Exercise") {
                TextField("Exercise", text: $exercise.name)
                    .textContentType(.name)
                Picker("How many reps?", selection: $exercise.numberOfReps) {
                    ForEach(1..<6) { reps in
                        Text("\(reps)x").tag(reps)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Enter the weigth") {
                TextField("Used Weight", text: $weightOrTimeText)
                    .keyboardType(.decimalPad)
            }
            
            Section("Enter your goal weight") {
                TextField("Your Goal", text: $goalText)
                    .keyboardType(.decimalPad)
            }
            
            Section("Enter the Date") {
                DatePicker("Enter the Date", selection: $exercise.date, displayedComponents: .date)
                    .labelsHidden()
            }
            
            Section("Details") {
                TextField("Details about this attempt.", text: $exercise.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit \(exercise.name)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if let weight = Double(weightOrTimeText) {
                        exercise.weightCountOrTime = weight
                        if let goal = Double(goalText) {
                            exercise.goalWeightOrTime = goal
                            let exercise = Exercise(
                                timeOrWeight: exercise.timeOrWeight,
                                name: exercise.name,
                                numberOfReps: exercise.numberOfReps,
                                weightCountOrTime: exercise.weightCountOrTime,
                                goalWeightOrTime: exercise.goalWeightOrTime,
                                details: exercise.details,
                                date: exercise.date)
                            modelContext.insert(exercise)
                            weightOrTimeText = ""
                            goalText = ""
                        }
                    }
                } label: {
                    Text("Save")
                    Image(systemName: "square.and.arrow.down.fill")
                }
            }
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return EditExerciseView(exercise: previewer.exercise, path: .constant(NavigationPath()))
            .modelContainer(previewer.container)
    } catch {
        return Text("🤬 ERROR: Failed to create preview: \(error.localizedDescription)")
    }
}
