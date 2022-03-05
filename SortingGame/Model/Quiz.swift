//
//  Quiz.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
//

import Foundation

// Tracks the result of answering a question
// Also stores unsolved questions
struct Quiz: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
    let answerGiven: String
    let answerCorrect: Status
}

// List of all questions (to be completed)
let Questions: [Quiz] = [Quiz(question: "Apple",
                                answer: "B",
                                answerGiven: "",
                                answerCorrect: Status.unsolved)]
