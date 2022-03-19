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
    public var imageName: String
    public var title: String
    public var quotes: [Quote]
}

public let testData = [
    Book(author: "Leo Tolstoy", imageName: "AnnaKareninaImage", title: "Anna Karenina", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "George Orwell", imageName: "1984Image", title: "1984", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Aldous Huxley", imageName: "BNWImage", title: "Brave New World", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "J.D. Sallinger", imageName: "CatcherImage", title: "Catcher in the Rye", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Harper Lee", imageName: "TKAMBImage", title: "To Kill a Mockingbird", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Douglas Adams", imageName: "HitchhikerImage", title: "Hitchhiker's Guide to the Galaxy", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Hendry David Thoreau", imageName: "WaldenImage", title: "Walden", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Fyodor Dostoyevski", imageName: "CAPImage", title: "Crime and Punishment", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Immanuel Kant", imageName: "KantImage", title: "Critique of Pure Reason", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Herman Melville", imageName: "MobyDickImage", title: "Moby Dick", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Neil Gaiman & Terry Pratchett", imageName: "GoodOmensImage", title: "Good Omens", quotes: [Quote(text: "Test text", pageNumber: 1, notes: nil)])
]
