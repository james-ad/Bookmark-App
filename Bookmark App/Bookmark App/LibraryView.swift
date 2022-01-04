//
//  LibraryView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/3/22.
//

import SwiftUI

struct LibraryView: View {
    var books: [Book] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    BookCell(book: book)
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(books: testStore.books)
    }
}

struct BookCell: View {
    var book: Book
    
    var body: some View {
        NavigationLink(destination: Text(book.title)) {
            Image(book.imageName)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(book.title)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(width: 300, height: 300, alignment: .leading)
        }
    }
}
