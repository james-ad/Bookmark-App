//
//  BookSelectionView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/25/22.
//

import SwiftUI

struct BookSelectionView: View {
    @State private var libraryIsEmpty = true
    
    var body: some View {
        // Insterad of loading the books from the demo library, these should instead load from local storage
        // IF no books are in library, then displays search page where user can add book
        // TODO: Make sure captured quote is added to book once they select book from search results
//        BookSearch()
        ScrollableLibraryView()
//            .hidden()
    }
    
}

struct BookSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BookSelectionView()
    }
}

struct ScrollableLibraryView: View {
    @FetchRequest(sortDescriptors: []) var library: FetchedResults<Book>
    @EnvironmentObject var store: BookStore
    @EnvironmentObject var capturedQuote: CapturedQuote
    @EnvironmentObject var cameraLauncher: CameraLauncher
    @State var shouldPerformSearch: Bool = false
    @State private var selectedBook = BookView(author: "", imageName: "", title: "", quotes: [QuoteView(text: "")])
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    if library.isEmpty {
                        Spacer()
                        Text("Library is empty. Please add a book to save the quote.")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                    } else {
                        ForEach(library) { book in
                            ScrollableBook(book: bookViewFromBook(book: book))
                            // TODO: Consider using id here instead
                                .background(book.title == selectedBook.title ? .mint : .clear)
                                .onTapGesture {
                                    print(book.title!)
                                    selectedBook = bookViewFromBook(book: book)
                                }
                        }
                    }
                }.frame(maxHeight: 300)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
            }
            .background(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            
            VStack {
                library.isEmpty ? Text("No books in library") : Text("Book selected: \(selectedBook.title)")
                Button(action: {
                    self.shouldPerformSearch.toggle()
                }) {
                    Text("Add new book")
                }.sheet(isPresented: $shouldPerformSearch) {
                    BookSearch()
                }
                
                Button(action: saveQuoteToSelectedBook) {
                    Text("Save")
                }
                .opacity(selectedBook.title.isEmpty ? 0.0 : 1.0)
            }
        }
    }
    
    func saveQuoteToSelectedBook() {
        // TODO: This can probably be made more efficient with a dictionary or a tree
        for (index, var book) in store.books.enumerated() {
            
            if book.id == selectedBook.id {
                print("BOOCH: \(book.quotes)")
                book.quotes.append(QuoteView(text: capturedQuote.text))
                print("BOOCH: \(book.quotes)")
                store.books[index] = book
            }
        }
        cameraLauncher.didFinishPickingImage = false
        cameraLauncher.didSaveQuote = true
    }
    
}

struct ScrollableBook: View {
    var book: BookView

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: book.imageName),
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(2)
                    },
                       placeholder: {
                ProgressView()
            })
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

//struct ScrollableBook: View {
//    var book: BookView
//
//    var body: some View {
//        VStack {
//            Image(book.imageName)
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(3)
//            Spacer()
//            VStack(alignment: .center) {
//                Text(book.title)
//                Text(book.author)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//            }
//            Spacer()
//            Spacer()
//        }
//        .background(.clear)
//        .padding(15)
//    }
//}
