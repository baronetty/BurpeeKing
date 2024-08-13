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
        NavigationStack {
            List {
                ForEach(exercises, id: \.self) { exercise in
                    NavigationLink(value: exercise) {
                        HStack {
                            Text(exercise.name)
                                .font(.title2.bold())
                                .foregroundStyle(.white)
                            
                            Image(systemName: exercise.timeOrWeight ? "timer" : "dumbbell.fill")
                                .padding(.horizontal)
                                .font(.title2)
                                .foregroundStyle(.black)
                                .bold()
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple.gradient).shadow(color: .black, radius: 4))
                    }
                }
                .onDelete(perform: deleteExercise)
            }
            .listStyle(.plain)
            .swipeActions {
                Button("Add Favorit", systemImage: "star") {
                    print("added")
                }
                .tint(.yellow)
            }
        }
        .mask {
            LinearGradient(gradient: Gradient(colors: [.black, .clear]),
                           startPoint: .init(x: 0.5, y: 0.8),
                           endPoint: .bottom)
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
