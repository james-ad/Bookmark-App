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

let testStore = BookStore(books: testData)
