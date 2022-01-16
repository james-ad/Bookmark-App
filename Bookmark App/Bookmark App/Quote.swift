//
//  Quote.swift
//  Bookmark App
//
//  Created by James Dunn on 1/1/22.
//

import Foundation

public struct Quote: Identifiable {
    public var id = UUID()
    var text: String
    var pageNumber: Int
    var notes: String?
}

public let testQuotes = [
    Quote(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 1, notes: nil),
    Quote(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 2, notes: nil),
    Quote(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 3, notes: nil),
    Quote(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 4, notes: nil),
    Quote(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 5, notes: nil),
    Quote(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 6, notes: nil)
]
