//
//  ModularBookSearch.swift
//  Bookmark
//
//  Created by James Dunn on 10/16/22.
//

import SwiftUI

struct ModularBookSearch: View {
    @EnvironmentObject var store: BookStore
    @State var searchText: String = ""
    @State var searchResults: [BookView] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                        .searchable(text: $searchText)
                        .onChange(of: searchText) { newText in
                            if searchText.isEmpty {
                                searchResults = []
                            }
                            performNewSearch(withText: newText)
                        }
                }
                
                List {
                    ForEach(searchResults) { book in
                        AsyncBookCell(bookView: book)
                    }
                }
                .navigationTitle("Search")
            }
        }
    }
    
    func performNewSearch(withText text: String) {
        Task {
            guard let results = await BookSearchNetworkClient.performBookSearch(withText: text)?.items else { return }
            // Reset/replace the current searchResults with the new results returned from the Google Books API
            var newResults: [BookView] = []
            results.forEach { book in
                let secureImageURL = book.volumeInfo.imageLinks.thumbnail.replacingOccurrences(of: "http", with: "https")
                let bookView = BookView(author: book.volumeInfo.authors[0],
                                        imageName: secureImageURL,
                                        title: book.volumeInfo.title,
                                        quotes: [QuoteModel(text: "")])
                newResults.append(bookView)
            }
            searchResults = newResults
        }
    }
}

struct ModularBookSearch_Previews: PreviewProvider {
    static var previews: some View {
        ModularBookSearch()
    }
}
