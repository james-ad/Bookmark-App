//
//  QuoteView.swift
//  Bookmark App
//
//  Created by James Dunn on 8/28/22.
//

import SwiftUI

struct QuoteView: View {
    @State var text: String
    var body: some View {
        TextEditor(text: $text)
            .padding()
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(text: "Hello, Waldo")
    }
}
