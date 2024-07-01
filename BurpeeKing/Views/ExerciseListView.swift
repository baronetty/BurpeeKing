//
//  ExerciseView.swift
//  BurpeeKing
//
//  Created by Leo  on 15.01.24.
//

import SwiftData
import SwiftUI

struct ExerciseListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [Exercise]
    
    var body: some View {
        List {
            ForEach(exercises) { exercise in
                NavigationLink(value: exercise) {
                    Text(exercise.name)
                }
            }
            .onDelete(perform: deleteExercise)
        }
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Exercise>] = []) {
        _exercises = Query(filter: #Predicate { exercise in
            if searchString.isEmpty {
                true
            } else {
                exercise.name.localizedStandardContains(searchString)
                || exercise.details.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteExercise(at offsets: IndexSet) {
        for offset in offsets {
            let exercise = exercises[offset]
            modelContext.delete(exercise)
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return ExerciseListView()
            .modelContainer(previewer.container)
    } catch {
        return Text("🤬 ERROR: Failed to create preview: \(error.localizedDescription)")
    }
}
