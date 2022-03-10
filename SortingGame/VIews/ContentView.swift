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
    
    // Tracks all questions completed so far
    @State var completedQuizzes: [Quiz] = []
    
    // Holds the user's current answer
    @State var inputGiven: Bin = .recycle

    // Tracks whether the input has been checked yet
    // and whether it is correct or not
    @State var status: Status = .unsolved
    
    // Controls whether to show HistoryView or not
    @State var showHistoryView: Bool = false
    
    // MARK: Computed properties
    
    // The main user interface
    var body: some View {
        
        VStack(spacing: 0) {
            
            VStack {
                
                // Displays the question
                Text("Where does \(quiz!.object) go?")
                
                // Result and input area
                Picker("Pick Answer", selection: $inputGiven) {
                    Text(Bin.recycle.rawValue)
                        .tag(Bin.recycle)
                    Text(Bin.compost.rawValue)
                        .tag(Bin.compost)
                    Text(Bin.garbage.rawValue)
                        .tag(Bin.garbage)
                    Text(Bin.liquid.rawValue)
                        .tag(Bin.liquid)

                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

            }
            
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                // Only show this when the answer given is correct
                    .opacity(status == .correct ? 1.0 : 0.0)
                
                Image(systemName: "x.square")
                    .foregroundColor(.red)
                // Only show this when the answer given is incorrect
                // Neither of the images show up when the quiz is unsolved
                    .opacity(status == .incorrect ? 1.0 : 0.0)
            }
            
            // Buttons for the user
            ZStack {
                
                // Allow the user's answer to be checked
                Button(action: {
                    
                    // Checks answers
                    if inputGiven == quiz!.bin {
                        
                        status = .correct
                        
                    } else {
                        
                        status = .incorrect
                        
                    }
                    
                    // Save this attempt to history
                    saveResult()
                    
                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
                // Only show this button when an answer has not been checked
                    .opacity(status == .unsolved ? 1.0 : 0.0)
                    .padding()
                    .buttonStyle(.bordered)
                
                // Allow new question to be generated
                Button(action: {
                    
                    // Randomly pick a new question
                    quiz = uncompletedQuizzes.randomElement()
                    
                    // Reset question status accordingly
                    status = .unsolved
                    
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                
                // Only show this button when an answer has been checked
                    .opacity(status == .correct ||
                             status == .incorrect ? 1.0 : 0.0)
                
            }
            
            // Gives an option for the user to review their past attempts
            Button(action: {
                
                // Shows HistoryView
                showHistoryView = true
                
            }, label: {
                Text("History")
                    .font(.largeTitle)
            })
                .sheet(isPresented: $showHistoryView) {
                    // Passes the updated list of attempts to HistoryView
                    HistoryView(pastQuizzes: $completedQuizzes)
                }
                .padding()
                .buttonStyle(.bordered)
            
        }

    }
    
    // MARK: Functions
    // Save user's current attempt
    func saveResult() {
        
        // Create an instance of the current attempt based on user inputs
        let newResult = Quiz(object: quiz!.object,
                             bin: quiz!.bin,
                             answerGiven: inputGiven,
                             status: status)
        
        // Ensure most recent attempt is at the start of the list
        completedQuizzes.insert(newResult, at: 0)
        
    }

}
