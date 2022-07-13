//
//  BookQuotesView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/15/22.
//

import SwiftUI

struct BookQuotesView: View {
    @State var image: String
    @State var title: String
    @State var quotes: [QuoteView]
    
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
    var bookView: BookView
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: bookView.imageName),
                           content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .border(.gray, width: 2)
                        .padding()
                        .shadow(color: .black, radius: 4, x: 4, y: 4)
                }, placeholder: {
                    ProgressView()
                })
                Text(bookView.title)
                    .font(.title2)
            }
            .padding()
            .border(.gray, width: 5)
            .cornerRadius(3)
            
            List {
                ForEach(bookView.quotes) { quote in
                    Text(quote.text)
                }
            }
            
            Button("Add book to library", action: {
                let book = Book(context: moc)
                book.id = bookView.id
                book.author = bookView.author
                book.title = bookView.title
                book.imageURL = bookView.imageName
                print("Book was successfully added to Core Data")
                presentationMode.wrappedValue.dismiss()
            })
        }
        Spacer()
        Spacer()
    }
}

struct BookQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        BookQuotesView(image: testStore.books[0].imageName, title: "Test Title", quotes: [testQuotes[0]])
    }
}
