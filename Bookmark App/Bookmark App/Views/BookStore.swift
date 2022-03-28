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
