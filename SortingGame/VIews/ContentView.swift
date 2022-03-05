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
    
    // Holds the user input
    @State var inputGiven = ""

    // Tracks whether the input has even been checked yet
    @State var status: Status = Status.unsolved
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Displays the question
            Text("Where does \(quiz!.object) go?")
            
            // Displays possible answer choices
            Text("A – ... B – Compost C – ...")
            
            // Result and input area
            HStack {
                
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    // Only show this when the answer given is correct
                        .opacity(status == Status.correct ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                    // Only show this when the answer given is correct
                    // Neither of the images show up when the quiz is unsolved
                        .opacity(status == Status.incorrect ? 1.0 : 0.0)
                }
                
                Spacer()
                
                TextField("", text: $inputGiven)
                // Ensure input is right-aligned
                    .multilineTextAlignment(.trailing)
            }
            
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
