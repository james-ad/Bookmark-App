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
    public var imageName: String = ""
    public var title: String = ""
    public var quotes: [QuoteModel] = []
}

public var testData = [
    BookView(author: "Leo Tolstoy", imageName: "AnnaKareninaImage", title: "Anna Karenina", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "George Orwell", imageName: "1984Image", title: "1984", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Aldous Huxley", imageName: "BNWImage", title: "Brave New World", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "J.D. Sallinger", imageName: "CatcherImage", title: "Catcher in the Rye", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Harper Lee", imageName: "TKAMBImage", title: "To Kill a Mockingbird", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Douglas Adams", imageName: "HitchhikerImage", title: "Hitchhiker's Guide to the Galaxy", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Hendry David Thoreau", imageName: "WaldenImage", title: "Walden", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Fyodor Dostoyevski", imageName: "CAPImage", title: "Crime and Punishment", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Immanuel Kant", imageName: "KantImage", title: "Critique of Pure Reason", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Herman Melville", imageName: "MobyDickImage", title: "Moby Dick", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    BookView(author: "Neil Gaiman & Terry Pratchett", imageName: "GoodOmensImage", title: "Good Omens", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)])
]

public var testLibrary = [
    TestBook(author: "Leo Tolstoy", imageName: "AnnaKareninaImage", title: "Anna Karenina", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "George Orwell", imageName: "1984Image", title: "1984", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Aldous Huxley", imageName: "BNWImage", title: "Brave New World", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "J.D. Sallinger", imageName: "CatcherImage", title: "Catcher in the Rye", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Harper Lee", imageName: "TKAMBImage", title: "To Kill a Mockingbird", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Douglas Adams", imageName: "HitchhikerImage", title: "Hitchhiker's Guide to the Galaxy", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Hendry David Thoreau", imageName: "WaldenImage", title: "Walden", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Fyodor Dostoyevski", imageName: "CAPImage", title: "Crime and Punishment", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Immanuel Kant", imageName: "KantImage", title: "Critique of Pure Reason", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Herman Melville", imageName: "MobyDickImage", title: "Moby Dick", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)]),
    TestBook(author: "Neil Gaiman & Terry Pratchett", imageName: "GoodOmensImage", title: "Good Omens", quotes: [QuoteModel(text: "Test text", pageNumber: 1, notes: nil)])
]

public class TestBook {
    public var author: String
    public var imageName: String
    public var title: String
    public var quotes: [QuoteModel]
    
    init(author: String, imageName: String, title: String, quotes: [QuoteModel] = []) {
        self.author = author
        self.imageName = imageName
        self.title = title
        self.quotes = quotes
    }
    
    public func addQuote(quote: QuoteModel) {
        quotes.append(quote)
    }
}
