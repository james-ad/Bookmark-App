//
//  Book.swift
//  Bookmark App
//
//  Created by James Dunn on 1/1/22.
//

import Foundation

public struct Book: Identifiable {
    public var id = UUID()
    public var author: String
    public var title: String
    public var quotes: [Quote]
}

public let testData = [
    Book(author: "Leo Tolstoy", title: "Anna Karenina", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "George Orwell", title: "1984", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Aldous Huxley", title: "Brave New World", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "J.D. Sallinger", title: "Catcher in the Rye", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Harper Lee", title: "To Kill a Mockingbird", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Douglas Adams", title: "Hitchhiker's Guide to the Galaxy", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Hendry David Thoreau", title: "Walden", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Fyodor Dostoyevski", title: "Crime and Punishment", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Immanuel Kant", title: "Critique of Pure Reason", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Herman Melville", title: "Moby Dick", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Neil Gaiman & Terry Pratchett", title: "Good Omens", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)])
]
