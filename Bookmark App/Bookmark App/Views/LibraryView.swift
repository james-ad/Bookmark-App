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
    
    private func bookViewFromBook(book: Book) -> BookView {
        var quotes: [QuoteView] = []
        book.quotes?.forEach { quote in
            let q = quote as? Quote
            let qv = QuoteView(id: q?.id ?? UUID(), text: q?.text ?? "", pageNumber: Int(q?.pageNumber ?? 0), notes: nil)
            quotes.append(qv)
        }
        return BookView(id: book.id ?? UUID(),
                                author: book.author ?? "no author",
                                imageName: book.imageURL ?? "",
                                title: book.title ?? "no title",
                                quotes: quotes)
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
