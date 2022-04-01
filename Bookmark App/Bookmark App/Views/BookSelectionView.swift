//
//  BookSelectionView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/25/22.
//

import SwiftUI

struct BookSelectionView: View {
    @EnvironmentObject var store: BookStore
    @EnvironmentObject var capturedQuote: CapturedQuote
    @EnvironmentObject var cameraLauncher: CameraLauncher
    @State private var selectedBook = BookView(author: "", imageName: "", title: "", quotes: [QuoteView(text: "")])
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(store.books) { book in
                    ScrollableBook(book: book)
                    // TODO: Consider using id here instead
                        .background(book.title == selectedBook.title ? .mint : .clear)
                        .onTapGesture {
                            print(book.title)
                            selectedBook = book
                        }
                }
            }.frame(maxHeight: 300)
        }
        .background(.gray)
        
        VStack {
            Text("Book selected: \(selectedBook.title)")
            Button(action: saveQuoteToSelectedBook) {
                Text("Save")
            }
            .opacity(selectedBook.title.isEmpty ? 0.0 : 1.0)
        }
    }
    
    func saveQuoteToSelectedBook() {
        // TODO: This can probably be made more efficient with a dictionary
        for (index, var book) in store.books.enumerated() {
            
            if book.id == selectedBook.id {
                print("BOOCH: \(book.quotes)")
                book.quotes.append(QuoteView(text: capturedQuote.text))
                print("BOOCH: \(book.quotes)")
                store.books[index] = book
            }
        }
        cameraLauncher.didFinishPickingImage = false
    }
}

struct BookSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BookSelectionView()
    }
}

struct ScrollableBook: View {
    var book: BookView
    
    var body: some View {
        VStack {
            Image(book.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(3)
            Spacer()
            VStack(alignment: .center) {
                Text(book.title)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Spacer()
        }
        .background(.clear)
        .padding(15)
    }
}
