//
//  WelcomeView.swift
//  BurpeeKing
//
//  Created by Leo  on 01.07.24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var path = NavigationPath()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Image(systemName: "figure.strengthtraining.traditional")
                .font(.system(size: 50))
                .bold()
                .foregroundStyle(.purple)
                .symbolEffect(.pulse)
            
            Text("Welcome to BurpeeKing")
                .padding()
                .font(.largeTitle)
            
            Text("Hi there, great that you are using BurpeeKing. To enjoy the full experience, please add your first diary entry.")
                .padding(.horizontal)
                .foregroundStyle(.secondary)
            
            Button("Add Exercise", systemImage: "plus") {
                showingSheet.toggle()
            }
            .padding()
        }
        .sheet(isPresented: $showingSheet) {
            NavigationStack {
                EditExerciseView(exercise: Exercise(), path: $path)
            }
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
}
