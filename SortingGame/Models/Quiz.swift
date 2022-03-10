//
//  Quiz.swift
//  SortingGame
//
//  Created by Yeseo Kim on 2022-03-04.
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
// Setting the default answer given to "recycle" to
// avoid using nil values
let uncompletedQuizzes: [Quiz] = [Quiz(object: "Apple",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Chicken bones",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Creamy soup",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Egg shells",
                                       bin: .compost,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Biodegradable cutleries",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Greasy pizza hut box",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Markers",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Masks",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Paper cups with plastic lining",
                                       bin: .garbage,
                                       answerGiven: .recycle,
                                       status: .unsolved),
                                  Quiz(object: "Pepper packets with pepper",
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
                                  Quiz(object: "Cans",
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
                                  Quiz(object: "Pristine paper plates",
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
                                  Quiz(object: "Test papers",
                                       bin: .recycle,
                                       answerGiven: .recycle,
                                       status: .unsolved)]
