//
//  EditQuoteView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/1/22.
//

import SwiftUI

public struct EditQuoteView: View {
    public var body: some View {
        VStack {
            Spacer()
            Text("Books")
            //            Menu("Choose book") {
            Spacer()
            BookList(books: testStore.books, selectedBook: testStore.books[0].title)
            Spacer()
            TextEditor(text: /*@START_MENU_TOKEN@*/.constant("Placeholder")/*@END_MENU_TOKEN@*/)
                .border(.black, width: 2)
            Spacer()
            Spacer()
            Button("Save Quote", action: saveQuote)
                .border(.black, width: 2)
                .cornerRadius(5)
                .padding(10)
            Spacer()
        }
    }
    
    private func saveQuote() {
        print("Quote saved")
        
    }
    
}

struct EditQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditQuoteView()
    }
}

enum BookTitles: String, CaseIterable, Identifiable {
    case foo
    case bar
    
    var id: String { self.rawValue }
}

struct BookList: View {
    @State var selectedBook: String
    var books: [BookView] = []
    
    var body: some View {
        VStack {
            Spacer()
            Picker("Choose Book", selection: $selectedBook) {
                ForEach(books) { book in
                    Text(book.title).tag(book.title)
                }
            }
            .border(.gray, width: 2)
            Spacer()
        }
    }
    
    init(books: [BookView], selectedBook: String) {
        self.books = books
        self.selectedBook = selectedBook
    }
}
