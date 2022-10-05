//
//  BookCell.swift
//  Bookmark App
//
//  Created by James Dunn on 7/13/22.
//

import SwiftUI

struct BookCell: View {
    var book: BookView
    
    var body: some View {
        NavigationLink(destination: BookQuotesView(image: book.imageName,
                                                   title: book.title,
                                                   quotes: book.quotes)) {
            HStack {
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
                Spacer()
                Spacer()
            }
            .frame(maxHeight: 66, alignment: .leading)
        }
    }
}

// AsyncBookCell is for displaying book info fetched from google books API on the search page
struct AsyncBookCell: View {
    var bookView: BookView
    
    init(bookView: BookView) {
        self.bookView = bookView
    }
        
    var body: some View {
        NavigationLink(destination: AsyncBookQuotesView(bookView: bookView)) {
            HStack {
                AsyncImage(url: URL(string: bookView.imageName),
                           content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(2)
                        },
                           placeholder: {
                    ProgressView()
                })
                VStack(alignment: .leading) {
                    Text(bookView.title)
                    Text(bookView.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(maxHeight: 66, alignment: .leading)
        }
    }
}

struct BookCell_Previews: PreviewProvider {
    static var previews: some View {
        let book = BookView()
        BookCell(book: book)
    }
}
