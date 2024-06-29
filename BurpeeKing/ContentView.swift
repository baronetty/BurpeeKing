

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = NavigationPath()
    
    @State private var sortOrder = [SortDescriptor(\Exercise.name)]
    @State private var searchText = ""
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ExerciseListView(searchString: searchText, sortOrder: sortOrder)
                .navigationTitle("BurpeeKing")
                .navigationDestination(for: Exercise.self) { exercise in
                    EditExerciseView(exercise: exercise, path: $path)
                }
                .toolbar {
                    ToolbarItem {
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Name A-Z")
                                    .tag([SortDescriptor(\Exercise.name)])
                                
                                Text("Name Z-A")
                                    .tag([SortDescriptor(\Exercise.name, order: .reverse)])
                            }
                        }
                    }
                    
                    ToolbarItem {
                        Button("Add Exercise", systemImage: "plus") {
                            showingSheet.toggle()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                .sheet(isPresented: $showingSheet) {
                    NavigationStack {
                        EditExerciseView(exercise: Exercise(), path: $path)
                    }
                }
                .searchable(text: $searchText)
        }
        .navigationTitle("BurpeeKing")
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return ContentView()
            .modelContainer(previewer.container)
    } catch {
        return Text("🤬 ERROR: Failed to create preview: \(error.localizedDescription)")
    }
}
