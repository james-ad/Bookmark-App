//
//  BookSearch.swift
//  Bookmark App
//
//  Created by James Dunn on 1/13/22.
//

import SwiftUI

struct BookSearch: View {
    @EnvironmentObject var store: BookStore
    @State var searchText: String = ""
    @State var searchResults: [BookView] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    TextField("Search for title or author", text: $searchText)
                        .padding()
                        .border(.black, width: 2)
                        .onChange(of: searchText) { newText in
                            print(newText)
                            doThingy(text: newText)
                        }
                    Spacer()
                }
                
                List {
                    ForEach(searchResults) { book in
                        AsyncBookCell(book: book)
                    }
                }
                .navigationTitle("Search")
            }
        }
    }
    
    func doThingy(text: String) {
        let foo = "Words"
        print(foo)
        Task {
            guard let results = await BookSearchNetworkClient.performBookSearch(withText: text)?.items else { return }
            print("BAR BAR BAR BAR: \(results)")
            results.forEach { book in
                let bookView = BookView(author: book.volumeInfo.authors[0],
                                        imageName: book.volumeInfo.imageLinks.thumbnail,
                                        title: book.volumeInfo.title,
                                        quotes: [QuoteView(text: "Hello, World")])
                searchResults.append(bookView)
            }
            
        }
    }
}

struct BookSearch_Previews: PreviewProvider {
    static var previews: some View {
        BookSearch()
    }
}
