//
//  Bin.swift
//  SortingGame
//

import Foundation

// This enumeration defines the types of bins.
// It limits the number of possible answers
// to the listed types of bins.
// It is also used to determine whether an attempt
// should be visible in the HistoryView.
enum Bin: String {
    case all = "All"
    case recycle = "Recycle"
    case compost = "Compost"
    case garbage = "Garbage"
    case liquid = "Liquid"
}
