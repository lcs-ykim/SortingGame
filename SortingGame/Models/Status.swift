//
//  Status.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
//

import Foundation

// Simlar to a Bool, an enumeration defines a list of possible values.
// This enumeration indicates the current status of a quiz.
// It is used to determine whether an attempt
// should be visible in the HistoryView.
// It also determines what button should show up
// when the user have OR have not checked their answer.
enum Status: String {
    case unsolved
    case correct = "Correct"
    case incorrect = "Incorrect"
}
