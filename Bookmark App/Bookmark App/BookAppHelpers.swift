//
//  BookAppHelpers.swift
//  Bookmark App
//
//  Created by James Dunn on 7/31/22.
//

import Foundation

func bookViewFromBook(book: Book) -> BookView {
    var quotes: [QuoteModel] = []
    book.quotes?.forEach { quote in
        let q = quote as? Quote
        let qv = QuoteModel(id: q?.id ?? UUID(), text: q?.text ?? "", pageNumber: Int(q?.pageNumber ?? 0), notes: nil)
        quotes.append(qv)
    }
    return BookView(id: book.id ?? UUID(),
                            author: book.author ?? "no author",
                            imageName: book.imageURL ?? "",
                            title: book.title ?? "no title",
                            quotes: quotes)
}
