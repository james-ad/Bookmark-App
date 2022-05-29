//
//  LibraryView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/3/22.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var store: BookStore
    var body: some View {
        NavigationView {
            List {
                ForEach(store.books) { book in
                    BookCell(book: book)
                }
                .onMove(perform: moveBook)
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("Library")
            .toolbar {
                HStack {
                EditButton()
                    NavigationLink(destination: AddBookView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func moveBook(from: IndexSet, to: Int) {
        print("Book moved")
        withAnimation {
            store.books.move(fromOffsets: from, toOffset: to)
        }
    }
    
    private func deleteBook(offset: IndexSet) {
        print("Book delted")
        withAnimation {
            store.books.remove(atOffsets: offset)
        }
    }
    
    private func addBook() {
        print("Book added")
        withAnimation {
            store.books.append(BookView(author: "James Dunn",
                                    imageName: "book",
                                    title: "Title",
                                    quotes: [QuoteView(text: "Quote", pageNumber: 1, notes: nil)]))
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

struct BookCell: View {
    var book: BookView
    
    var body: some View {
        NavigationLink(destination: BookQuotesView( image: book.imageName, title: book.title, quotes: book.quotes)) {
            HStack {
                Image(book.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(3)
                Spacer()
                VStack(alignment: .leading) {
                    Text(book.title)
                    Text(book.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(maxHeight: 66, alignment: .leading)
        }
    }
}

struct AsyncBookCell: View {
    var book: BookView
    var bookImage: UIImage = UIImage(systemName: "book")!
    init(book: BookView) {
        self.book = book
        print("brrrrOOOK: \(book.imageName)")
    }
        
    var body: some View {
        NavigationLink(destination: BookQuotesView( image: book.imageName, title: book.title, quotes: book.quotes)) {
            HStack {
                AsyncImage(url: URL(fileURLWithPath: book.imageName, isDirectory: true)) { image in
                    image
                        .resizable()
                } placeholder: {
//                    ProgressView()
                    Image(systemName: "book")
                }
                    .scaledToFit()
                    .cornerRadius(3)
                Spacer()
                VStack(alignment: .leading) {
                    Text(book.title)
                    Text(book.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(maxHeight: 66, alignment: .leading)
        }
    }
}
