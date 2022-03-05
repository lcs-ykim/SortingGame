//
//  HistoryView.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
//

import SwiftUI

struct HistoryView: View {
    
    // MARK: Stored Properties
    @Binding var pastQuizzes: [Quiz]
    
    var body: some View {
        
        // Show results of prior questions attempted
        List(pastQuizzes) { result in
            HStack {
                Text("Where does \(result.object) go?")
                Text("Your answer was \(result.answerGiven).")
                Text("The correct answer was \(result.bin).")
                    .opacity(result.status == Status.incorrect ? 1.0 : 0.0)
                Spacer()
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        .opacity(result.status == Status.correct ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                        .opacity(result.status == Status.incorrect ? 1.0 : 0.0)
                }
            }
            .font(.title)
        }
        .padding(.horizontal)
        .font(.system(size: 72))
    }
}
