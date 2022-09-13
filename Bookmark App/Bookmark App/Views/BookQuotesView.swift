//
//  BookQuotesView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/15/22.
//

import SwiftUI
import AlertToast

struct BookQuotesView: View {
    @State var image: String
    @State var title: String
    @State var quotes: [QuoteModel]
    
    var body: some View {
        VStack {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .border(.gray, width: 2)
                    .padding()
                    .shadow(color: .black, radius: 4, x: 4, y: 4)
                Text(title)
                    .font(.title2)
            }
            .padding()
            .border(.gray, width: 5)
            .cornerRadius(3)
            
            List {
                ForEach(quotes) { quote in
                    Text(quote.text)
                }
            }
        }
    }
}

struct AsyncBookQuotesView: View {
    @FetchRequest(sortDescriptors: []) var library: FetchedResults<Book>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cameraLauncher: CameraLauncher
    @State private var quoteShouldBeAdded: Bool = false
    @State private var image = UIImage()
    var bookView: BookView
    var currentBook: Book? {
        library.filter { $0.title == bookView.title }.first
    }
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: bookView.imageName),
                           content: { image in
                    image
                        .resizable()
                        .border(.gray, width: 2)
                        .cornerRadius(5)
                        .scaledToFit()
                        .padding()
                        .shadow(color: .black, radius: 6, x: 4, y: 4)
                }, placeholder: {
                    ProgressView()
                })
                
                Text(bookView.title)
                    .font(.title2)
            }
            .padding()
            
            if let currentBook = currentBook, currentBook.quotes?.count ?? 0 < 1 {
                Text("There are no quotes for this book yet.")
                    .font(.headline)
                    .offset(y: 10)
            }
            List {
                if !library.isEmpty,
                   let currentBook = currentBook {
                    ForEach(Array(currentBook.quotes as! Set<Quote>), id: \.self) { quote in
                        if let quoteText = quote.text {
                            let displayedQuote = quoteText.count < 100 ?
                            quoteText :
                            quoteText.prefix(upTo: quoteText.index(quoteText.startIndex, offsetBy: 100)) + "..."
                            NavigationLink(displayedQuote, destination: QuoteView(text: quoteText))
                                .padding()
                        }
                    }
                    .onDelete(perform: deleteBook)
                }
            }
            
            let bookAlreadyInLibrary = !library.filter { $0.title == bookView.title }.isEmpty
            
            // TODO: After MVP, change this so that a quote can be added from the book quotes view
            //            let buttonLabel = bookAlreadyInLibrary ? "Add quote" : "Add book to library"
            if !bookAlreadyInLibrary {
                let buttonLabel = "Add book to library"
                Button(buttonLabel, action: {
                    // First check to make sure book doesn't already exist in library so as not to create duplicate
                    guard !bookAlreadyInLibrary else {
                        // TODO: Uncomment code after MVP
                        //                    quoteShouldBeAdded = true
                        return
                    }
                    
                    let book = Book(context: moc)
                    book.id = bookView.id
                    book.author = bookView.author
                    book.title = bookView.title
                    book.imageURL = bookView.imageName
                    try? moc.save()
                    print("Book was successfully added to Core Data")
                    presentationMode.wrappedValue.dismiss()
                })
                .padding()
                .sheet(isPresented: $quoteShouldBeAdded) {
                    ImagePicker(selectedImage: self.$image, sourceType: .camera)
                }}
        }
        .sheet(isPresented: $cameraLauncher.didFinishPickingImage) {
            CapturedQuoteView()
        }
        .toast(isPresenting: $cameraLauncher.didSaveQuote,
               duration: 2,
               tapToDismiss: true,
               offsetY: -200,
               alert: {
            AlertToast(displayMode: .banner(.pop),
                       type: .complete(.green),
                       title: "Quote saved!",
                       style: .style(backgroundColor: .green, titleColor: .white, subTitleColor: nil, titleFont: nil, subTitleFont: nil))
        })
        Spacer()
        Spacer()
    }
    
    private func deleteBook(at offsets: IndexSet) {
        guard let currentBook = currentBook, let quotes = currentBook.quotes else { return }
        print("Book delted")
        withAnimation {
        }
        for offset in offsets {
            let quote = quotes.reversed()[quotes.reversed().index(0, offsetBy: offset)]
            moc.delete(quote as! Quote)
        }
        
        try? moc.save()
    }
}

struct BookQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        BookQuotesView(image: testStore.books[0].imageName, title: "Test Title", quotes: [testQuotes[0]])
    }
}
