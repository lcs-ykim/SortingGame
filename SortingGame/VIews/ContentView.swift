//
//  ContentView.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
//

import SwiftUI

// A live view that displays a random question
struct ContentView: View {
    
    // MARK: Stored Properties
    
    // A random question generated
    @State var quiz = uncompletedQuizzes.randomElement()
    
    // Tracks all questions completed
    @State var completedQuizzes: [Quiz] = []
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Displays the question
            Text("Where does \(quiz!.object) go?")
            
            // Displays possible answer choices
            Text("A – ... B – Compost C – ...")
            
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
