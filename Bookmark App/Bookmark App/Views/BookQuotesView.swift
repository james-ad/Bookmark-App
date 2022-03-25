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
                Image(systemName: image)
                    .padding()
                Text("Hello, World")
            }
            
            List {
                ForEach(quotes) { quote in
                    Text(quote.text)
                }
            }
        }
    }
}

struct BookQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        BookQuotesView(image: testStore.books[0].imageName, title: "Test Title", quotes: [testQuotes[0]])
    }
}
