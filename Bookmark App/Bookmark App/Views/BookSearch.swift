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
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    TextField("Search for title or author", text: $searchText)
                        .padding()
                        .border(.black, width: 2)
                    Spacer()
                }
                
                List {
                    ForEach(store.books) { book in
                        BookCell(book: book)
                    }
                }
                .navigationTitle("Search")
            }
        }
    }
}

struct BookSearch_Previews: PreviewProvider {
    static var previews: some View {
        BookSearch()
    }
}
