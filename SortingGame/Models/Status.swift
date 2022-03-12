//
//  Status.swift
//  SortingGame
//

import Foundation

// Simlar to a Bool, an enumeration defines a list of possible values.
// This enumeration indicates the current status of a quiz.
// It determines what button should show up when
// the user have OR have not checked their answer.
enum Status: String {
    case unsolved
    case correct = "Correct"
    case incorrect = "Incorrect"
}
