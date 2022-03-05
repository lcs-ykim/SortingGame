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
    
    // Controls whether to show HistoryView or not
    @State var showHistoryView: Bool = false
    
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
            
            // Buttons to control program
            ZStack {
                
                // Allow input to be checked
                Button(action: {
                    
                    // Checks answer
                    
                    if inputGiven == quiz!.bin {
                        
                        status = Status.correct
                        
                    } else {
                        
                        status = Status.incorrect
                        
                    }
                    
                    // Save this result
                    saveResult()
                    
                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
                // Only show this button when an answer has not been checked
                    .opacity(status == Status.unsolved ? 1.0 : 0.0)
                    .padding()
                    .buttonStyle(.bordered)
                
                // Allow new question to be generated
                Button(action: {
                    
                    // Generate a new question
                    quiz = uncompletedQuizzes.randomElement()
                    
                    // Reset properties that track what's happening with the current question
                    status = Status.unsolved
                    
                    // Reset the input field
                    inputGiven = ""
                    
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                
                // Only show this button when an answer has been checked
                    .opacity(status == Status.correct ||
                             status == Status.incorrect ? 1.0 : 0.0)
                
            }
            
            Button(action: {
                
                // Shows HistoryView
                showHistoryView = true
                
            }, label: {
                Text("History")
                    .font(.largeTitle)
            })
                .sheet(isPresented: $showHistoryView) {
                    HistoryView()
                }
                .padding()
                .buttonStyle(.bordered)
            
        }

    }
    
    // MARK: Functions
    // Save the result of a question that has been answered
    func saveResult() {
        
        // Create a result to save based on current question state
        let newResult = Quiz(object: quiz!.object,
                             bin: quiz!.bin,
                             answerGiven: inputGiven,
                             status: status)
        
        // Ensure most recent result is always at top of the list
        completedQuizzes.insert(newResult, at: 0)
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
