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
        // TODO: Make sure captured quote is added to book once they select book from search results
        ScrollableLibraryView()
    }
}

struct BookSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BookSelectionView()
    }
}

struct ScrollableLibraryView: View {
    @FetchRequest(sortDescriptors: []) var library: FetchedResults<Book>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: BookStore
    @EnvironmentObject var capturedQuote: CapturedQuote
    @EnvironmentObject var cameraLauncher: CameraLauncher
    @EnvironmentObject var bookSearchController: ModularBookSearchController
    @State var shouldPerformSearch: Bool = false
    @State private var selectedBook = BookView(author: "", imageName: "", title: "", quotes: [QuoteModel(text: "")])
    
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
                                .background(book.title == selectedBook.title ? .gray : .black)
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
            .background(.black)
            .border(.gray, width: 1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            
            VStack {
                let scrollText = library.isEmpty ? "No books in library" : "Book selected: \(selectedBook.title)"
                
                Text(scrollText)
                    .font(.title3)
                    .padding()
                
                Button(action: saveQuoteToSelectedBook) {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
                .font(.title3)
                .opacity(selectedBook.title.isEmpty ? 0.0 : 1.0)
            }
            
            VStack {
                Text("Book not in your library yet? Go to the \"Search\" to add it before saving your quote.")
                    .multilineTextAlignment(.center)
                // TODO: Comment out button until odd behavior can be fixed
                // MARK: Right now, the quotes view is presented when book is selected because of didFinishPickingImage inside of AsyncBookQuotesView where it presents CapturedQuoteView
                                Button(action: {
                                    bookSearchController.shouldPresentSearchPage = true
                                }) {
                                    Text("Add new book")
                                }.sheet(isPresented: $bookSearchController.shouldPresentSearchPage) {
                                    ModularBookSearch()
                                }
                                .buttonStyle(.bordered)
            }
            .offset(y: 60)
        }
    }
    
    func saveQuoteToSelectedBook() {
        // TODO: This can probably be made more efficient with a dictionary or a tree
        for book in library {
            if book.id == selectedBook.id {
                let quote = Quote(context: moc)
                quote.text = capturedQuote.text
                book.quotes = book.quotes?.adding(quote) as? NSSet
                try? moc.save()
            }
        }
        cameraLauncher.didFinishPickingImage = false
        cameraLauncher.didSaveQuote = true
        presentationMode.wrappedValue.dismiss()
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
