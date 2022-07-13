//
//  QuoteView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/1/22.
//

import Foundation

public struct QuoteView: Identifiable, Hashable {
    public var id = UUID()
    var text: String
    var pageNumber: Int?
    var notes: String?
}

public let testQuotes = [
    QuoteView(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 1, notes: nil),
    QuoteView(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 2, notes: nil),
    QuoteView(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 3, notes: nil),
    QuoteView(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 4, notes: nil),
    QuoteView(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 5, notes: nil),
    QuoteView(text: "FJAIOFJDIAFJD SKFJDOIAFJ  FIDJFIAOJFID FJFDAIOFJDIAFJI FIDAOF JIF.", pageNumber: 6, notes: nil)
]
