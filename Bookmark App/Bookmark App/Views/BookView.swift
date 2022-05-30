//
//  BookView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/1/22.
//

import Foundation
import UIKit

public struct BookView: Identifiable {
    public var id = UUID()
    public var author: String = ""
    public var imageName: String = "book"
    public var title: String = ""
    public var quotes: [QuoteView] = []
}

public var testData = [
    BookView(author: "Leo Tolstoy", imageName: "AnnaKareninaImage", title: "Anna Karenina", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "George Orwell", imageName: "1984Image", title: "1984", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Aldous Huxley", imageName: "BNWImage", title: "Brave New World", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "J.D. Sallinger", imageName: "CatcherImage", title: "Catcher in the Rye", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Harper Lee", imageName: "TKAMBImage", title: "To Kill a Mockingbird", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Douglas Adams", imageName: "HitchhikerImage", title: "Hitchhiker's Guide to the Galaxy", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Hendry David Thoreau", imageName: "WaldenImage", title: "Walden", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Fyodor Dostoyevski", imageName: "CAPImage", title: "Crime and Punishment", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Immanuel Kant", imageName: "KantImage", title: "Critique of Pure Reason", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Herman Melville", imageName: "MobyDickImage", title: "Moby Dick", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Neil Gaiman & Terry Pratchett", imageName: "GoodOmensImage", title: "Good Omens", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)])
]

public var testLibrary = [
    Book(author: "Leo Tolstoy", imageName: "AnnaKareninaImage", title: "Anna Karenina", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "George Orwell", imageName: "1984Image", title: "1984", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Aldous Huxley", imageName: "BNWImage", title: "Brave New World", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "J.D. Sallinger", imageName: "CatcherImage", title: "Catcher in the Rye", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Harper Lee", imageName: "TKAMBImage", title: "To Kill a Mockingbird", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Douglas Adams", imageName: "HitchhikerImage", title: "Hitchhiker's Guide to the Galaxy", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Hendry David Thoreau", imageName: "WaldenImage", title: "Walden", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Fyodor Dostoyevski", imageName: "CAPImage", title: "Crime and Punishment", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Immanuel Kant", imageName: "KantImage", title: "Critique of Pure Reason", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Herman Melville", imageName: "MobyDickImage", title: "Moby Dick", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)]),
    Book(author: "Neil Gaiman & Terry Pratchett", imageName: "GoodOmensImage", title: "Good Omens", quotes: [QuoteView(text: "Test text", pageNumber: 1, notes: nil)])
]

public class Book {
    public var author: String
    public var imageName: String
    public var title: String
    public var quotes: [QuoteView]
    
    init(author: String, imageName: String, title: String, quotes: [QuoteView] = []) {
        self.author = author
        self.imageName = imageName
        self.title = title
        self.quotes = quotes
    }
    
    public func addQuote(quote: QuoteView) {
        quotes.append(quote)
    }
}
