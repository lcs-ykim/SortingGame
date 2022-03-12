//
//  Quiz.swift
//  SortingGame
//

import Foundation

// Tracks the attempt of answering a question
// Also stores an unattempted question
struct Quiz: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let object: String
    let bin: Bin
    let answerGiven: Bin
    let status: Status
    
}

// List of all questions
// Setting the default answerGiven to "recycle" to
// avoid using nil values
let uncompletedQuizzes: [Quiz] = [Quiz(object: "Apple",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Chicken bone",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Creamy soup",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Egg shell",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Biodegradable cutlery",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Greasy pizza hut box",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Marker",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Mask",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Paper cup with plastic lining",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Salt packet",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Water",
                                       bin: .liquid,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Watery soup",
                                       bin: .liquid,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Soda can",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Empty cup noodles",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Paper",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Pristine paper plate",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Plastic water bottle",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Pristine Pizza hut box",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Test paper",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved)]
