//
//  Quiz.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
//

import Foundation

// Tracks the result of answering a question in the format of "Where does (object) go?")
// The correct answer is the corresponding type of bin (e.g. compost bin aka "B")
// Stores both unsolved and solved questions
struct Quiz: Identifiable {
    let id = UUID()
    let object: String
    let bin: Bin
    let answerGiven: Bin
    let status: Status
}

// List of all questions (TBC)
let uncompletedQuizzes: [Quiz] = [Quiz(object: "Apple",
                                       bin: .B,
                                answerGiven: "",
                                status: Status.unsolved)]
