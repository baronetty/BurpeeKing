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
    
    @State private var weightText: String = ""
    
    var body: some View {
        LineChartView(exercise: exercise)
        
        Form {
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
                TextField("Used Weight", text: $weightText)
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
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if let weight = Double(weightText) {
                        exercise.weightCount = weight
                        let exercise = Exercise(
                            name: exercise.name,
                            numberOfReps: exercise.numberOfReps,
                            weightCount: exercise.weightCount,
                            details: exercise.details,
                            date: exercise.date)
                        modelContext.insert(exercise)
                    }
                } label: {
                    Text("Save")
                    Image(systemName: "square.and.arrow.down.fill")
                }
            }
        }
        .navigationBarBackButtonHidden()
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
