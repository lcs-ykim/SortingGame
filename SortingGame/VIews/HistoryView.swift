//
//  HistoryView.swift
//  SortingGame
//

import SwiftUI

struct HistoryView: View {
    
    // MARK: Stored properties
    
    // Receives the updated list of user attempts
    @Binding var pastQuizzes: [Quiz]
    
    // Tracks attempts of which bin the user wants to see
    // e.g. If the selection were .compost the user would
    // only view the attempts which have .compost as the
    // correct type of bin
    @State private var selectedBin: Bin = .all
    
    // MARK: Computer properties
    
    var body: some View {
        
        // Control filtering of prior attempts
        VStack {
            // Label for picker
            Text("Filter by...")
                .font(Font.caption.smallCaps())
                .foregroundColor(.secondary)
            
            // Picker to allow user to select what attempts to show
            Picker("Filter", selection: $selectedBin) {
                Text(Bin.all.rawValue)
                    .tag(Bin.all)
                Text(Bin.compost.rawValue)
                    .tag(Bin.compost)
                Text(Bin.garbage.rawValue)
                    .tag(Bin.garbage)
                Text(Bin.liquid.rawValue)
                    .tag(Bin.liquid)
                Text(Bin.recycle.rawValue)
                    .tag(Bin.recycle)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
        }
        .padding(.bottom)
        
        // Show previous attempts based on user's filter choice
        List(filter(pastQuizzes, by: selectedBin)) { attempt in
            VStack {
                Text("\(attempt.bin.rawValue)")
                // Shows the type of bin associated with the attempt
                // only if the user chooses .all
                    .opacity(selectedBin == .all ? 1.0 : 0.0)
                Text("\(attempt.object)")
                Spacer()
                // Shows whether the user's attempt was correct or not.
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
    func filter(_ listOfAttempts: [Quiz], by bin: Bin) -> [Quiz] {
        
        // If the user wants to see attempts of all bins, return the original list
        if bin == .all {
            return listOfAttempts
        }
        
        // Create an empty list of attempts
        var filteredAttempts: [Quiz] = []
        
        // Iterate over the list of attempts, and build a filtered list
        // that only includes the attempts of selected bin
        for currentAttempt in listOfAttempts {
            
            if bin == .compost && currentAttempt.bin == .compost {
                filteredAttempts.insert(currentAttempt, at: 0)
            } else if bin == .garbage && currentAttempt.bin == .garbage {
                filteredAttempts.insert(currentAttempt, at: 0)
            } else if bin == .liquid && currentAttempt.bin == .liquid {
                filteredAttempts.insert(currentAttempt, at: 0)
            } else if bin == .recycle && currentAttempt.bin == .recycle {
                filteredAttempts.insert(currentAttempt, at: 0)
            }
            
        }
        
        // Return the filtered list of attempts
        return filteredAttempts

    }
    
}
