//
//  LibraryView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/3/22.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var store: BookStore
    var body: some View {
        NavigationView {
            List {
                ForEach(store.books) { book in
                    BookCell(book: book)
                }
                .onMove(perform: moveBook)
                .onDelete(perform: deleteBook)
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
            store.books.append(Book(author: "James Dunn",
                                    imageName: "book",
                                    title: "Title",
                                    quotes: [Quote(text: "Quote", pageNumber: 1, notes: nil)]))
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(store: testStore)
    }
}

struct BookCell: View {
    var book: Book
    
    var body: some View {
        NavigationLink(destination: Text(book.title)) {
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
        .navigationTitle("Library")
        .toolbar {
            EditButton()
        }
    }
}
