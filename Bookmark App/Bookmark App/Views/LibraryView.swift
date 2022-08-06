//
//  LibraryView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/3/22.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var store: BookStore
    @FetchRequest(sortDescriptors: []) var library: FetchedResults<Book>
    @Environment(\.managedObjectContext) var moc
    
    //    ForEach(Array(sample.stepps! as Set), id: \.self) { step in
    //        // step is NSObject type, so you'll need it cast to your model
    //    }
    var body: some View {
        NavigationView {
            List {
                ForEach(library) { book in
                    AsyncBookCell(bookView: bookViewFromBook(book: book))
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
    
    private func deleteBook(at offsets: IndexSet) {
        print("Book delted")
        withAnimation {
            for offset in offsets {
                let book = library[offset]
                moc.delete(book)
            }
            
            try? moc.save()
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
