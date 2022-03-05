//
//  HistoryView.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
//

import SwiftUI

struct HistoryView: View {
    
    // MARK: Stored properties
    @Binding var pastQuizzes: [Quiz]
    
    // Tracks what results should be visible currently
    @State private var selectedStatus: Status = .incorrect
    
    // MARK: Computer properties
    
    var body: some View {
        
        // Control filtering of prior tasks
        VStack {
            // Label for picker
            Text("Filter by...")
                .font(Font.caption.smallCaps())
                .foregroundColor(.secondary)
            
            // Picker to allow user to select what tasks to show
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
        
        // Show results of prior questions attempted
        List(filter(pastQuizzes, by: selectedStatus)) { result in
            VStack {
                Text("Where does \(result.object) go?")
                Text("You said it goes to \(result.answerGiven.rawValue).")
                Text("The correct answer was \(result.bin.rawValue).")
                    .opacity(result.status == .incorrect ? 1.0 : 0.0)
                Spacer()
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        .opacity(result.status == .correct ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                        .opacity(result.status == .incorrect ? 1.0 : 0.0)
                }
            }
            .font(.title)
        }
        .padding(.horizontal)
        .font(.system(size: 72))
    }
    
    // MARK: Functions
    // Filter the list of results to be shown
    func filter(_ listOfResults: [Quiz], by status: Status) -> [Quiz] {
        
        // Create an empty list of results
        var filteredResults: [Quiz] = []
        
        // Iterate over the list of results, and build a new list
        // that only includes the selected type of result
        for currentResult in listOfResults {
            
            if status == .correct && currentResult.status == .correct {
                filteredResults.insert(currentResult, at: 0)
            } else if status == .incorrect && currentResult.status == .incorrect {
                filteredResults.insert(currentResult, at: 0)
            }
            
        }
        
        // Return the filtered list of results
        return filteredResults
        
    }
    
}
