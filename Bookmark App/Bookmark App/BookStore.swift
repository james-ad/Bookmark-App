//
//  BookStore.swift
//  Bookmark App
//
//  Created by James Dunn on 1/1/22.
//

import Foundation

class BookStore: ObservableObject {
    @Published var books: [BookView]
    
    init(books: [BookView] = []) {
        self.books = books
    }
}

//var testStore = BookStore(books: testData)

var testStore: BookStore {
    var library: [BookView] = []
    
    for book in testLibrary {
        let bookView = BookView(author: book.author, imageName: book.imageName, title: book.title, quotes: book.quotes)
        library.append(bookView)
    }
    return BookStore(books: library)
}


//class Library: ObservableObject {
//    @Published var books: [Book] {
//        didSet {
//            fillQuotes()
//        }
//    }
//    @Published var quotes: [QuoteView] = []
//    
//    init(books: [Book]) {
//        self.books = books
//    }
//}
//
//private extension Library {
//    func fillQuotes() {
//        var quotesCopy = self.quotes
//        self.books.forEach { book in
//            quotesCopy.append(contentsOf: book.quotes)
////            book.quotes.forEach { quote in
////                self.quotes.append(quote)
////            }
//        }
//        self.quotes = quotesCopy
//    }
//}
