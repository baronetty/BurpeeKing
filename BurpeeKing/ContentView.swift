

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = NavigationPath()
    
    @State private var sortOrder = [SortDescriptor(\Exercise.name)]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            ExerciseView(searchString: searchText, sortOrder: sortOrder)
                .navigationTitle("BurpeeKing")
                .navigationDestination(for: Exercise.self) { exercise in
                    EditExerciseView(exercise: exercise, navigationPath: $path)
                }
                .toolbar {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name A-Z")
                                .tag([SortDescriptor(\Exercise.name)])
                            
                            Text("Name Z-A")
                                .tag([SortDescriptor(\Exercise.name, order: .reverse)])
                        }
                    }
                    
                    Button("Add Exercise", systemImage: "plus", action: addExercise)
                }
                .searchable(text: $searchText)
        }
        .navigationTitle("BurpeeKing")
    }
    
    func addExercise() {
        let exercise = Exercise(name: "", numberOfReps: 2, weightCount: 100, details: "", date: Date.now)
        modelContext.insert(exercise)
        path.append(exercise)
    }
    
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return ContentView()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
