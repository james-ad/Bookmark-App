//
//  BookStore.swift
//  Bookmark App
//
//  Created by James Dunn on 1/1/22.
//

import Foundation

class BookStore {
    var books: [Book]
    
    init(books: [Book] = []) {
        self.books = books
    }
}

let testStore = BookStore(books: testData)
