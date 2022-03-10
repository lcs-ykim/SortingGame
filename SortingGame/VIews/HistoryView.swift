//
//  HistoryView.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
//

import SwiftUI

struct HistoryView: View {
    
    // MARK: Stored properties
    
    // Receives the updated list of user attempts
    @Binding var pastQuizzes: [Quiz]
    
    // Tracks what type of attempts the user wants to see
    @State private var selectedStatus: Status = .incorrect
    
    // MARK: Computer properties
    
    var body: some View {
        
        // Control filtering of prior attempts
        VStack {
            // Label for picker
            Text("Filter by...")
                .font(Font.caption.smallCaps())
                .foregroundColor(.secondary)
            
            // Picker to allow user to select what attempts to show
            Picker("Filter", selection: $selectedStatus) {
                Text(Status.incorrect.rawValue)
                    .tag(Status.incorrect)
                Text(Status.correct.rawValue)
                    .tag(Status.correct)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
        }
        .padding(.bottom)
        
        // Show previous attempts based on user's filter choice
        List(filter(pastQuizzes, by: selectedStatus)) { attempt in
            VStack {
                Text("Where does \(attempt.object) go?")
                Text("You said it goes to \(attempt.answerGiven.rawValue).")
                Text("The correct answer was \(attempt.bin.rawValue).")
                    .opacity(attempt.status == .incorrect ? 1.0 : 0.0)
                Spacer()
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        .opacity(attempt.status == .correct ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                        .opacity(attempt.status == .incorrect ? 1.0 : 0.0)
                }
            }
            .font(.title)
        }
        .padding(.horizontal)
        .font(.system(size: 72))
    }
    
    // MARK: Functions
    
    // Filter the list of attempts to be shown
    func filter(_ listOfAttempts: [Quiz], by status: Status) -> [Quiz] {
        
        // Create an empty list of attempts
        var filteredAttempts: [Quiz] = []
        
        // Iterate over the list of attempts, and build a filtered list
        // that only includes the selected type of attempt
        for currentAttempt in listOfAttempts {
            
            if status == .correct && currentAttempt.status == .correct {
                filteredAttempts.insert(currentAttempt, at: 0)
            } else if status == .incorrect && currentAttempt.status == .incorrect {
                filteredAttempts.insert(currentAttempt, at: 0)
            }
            
        }
        
        // Return the filtered list of attempts
        return filteredAttempts
        
    }
    
}
