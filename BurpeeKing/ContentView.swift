import SwiftUI

struct ContentView: View {
   
    @State private var exercise = ""
    @State private var weightPercentage = 50 // Standardwert auf 50%
    @State private var weight = 0.0
    @FocusState private var weightIsFocused: Bool
    
    var exerciseWeight: Double {
        let weightSelection = Double(weightPercentage)
        let exerciseValue = weight * weightSelection / 100
        
        return exerciseValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Insert exercise") {
                    TextField("Exercise", text: $exercise)
                }
                
                Section("Add your 1RM") {
                    TextField("1RM", value: $weight, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($weightIsFocused)
                }
                
                Section("% of 1RM") {
                    Picker("1RM Percentage", selection: $weightPercentage) {
                        ForEach(0..<101) {
                            Text("\($0)% of 1RM")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Text("\(exerciseWeight, specifier: "%.2f")")
                }
            }
            .navigationTitle("BurpeeKing")
            .toolbar {
                if weightIsFocused {
                    Button("Done") {
                        weightIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
