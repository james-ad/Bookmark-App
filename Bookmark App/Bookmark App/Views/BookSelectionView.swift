//
//  BookSelectionView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/25/22.
//

import SwiftUI

struct BookSelectionView: View {
    @ObservedObject var store: BookStore
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(store.books) { book in
                    ScrollableBook(book: book)
                }
            }.frame(maxHeight: 300)
        }
        .background(.gray)
    }
}

struct BookSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BookSelectionView(store: testStore)
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
                VStack(alignment: .leading) {
                    Text(book.title)
                    Text(book.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Spacer()
            }
            .padding(15)
        }
}
