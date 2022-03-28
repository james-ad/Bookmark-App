//
//  BookSelectionView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/25/22.
//

import SwiftUI

struct BookSelectionView: View {
    @ObservedObject var store: BookStore
    @State private var selectedBook: String = "..."
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(store.books) { book in
                    ScrollableBook(book: book)
                        .background(book.title == selectedBook ? .mint : .clear)
                        .onTapGesture {
                            print(book.title)
                            selectedBook = book.title
                        }
                }
            }.frame(maxHeight: 300)
        }
        .background(.gray)
        
        HStack {
            Text("Book selected: \(selectedBook)")
            Button("Save") {
                print(selectedBook)
            }
        }
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
