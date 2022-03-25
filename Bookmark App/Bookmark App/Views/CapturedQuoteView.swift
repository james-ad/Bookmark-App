//
//  CapturedQuoteView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/23/22.
//

import SwiftUI

struct CapturedQuoteView: View {
    @EnvironmentObject var capturedQuote: CapturedQuote

    var body: some View {
//        NavigationView {
        Spacer()
        TextEditor(text: $capturedQuote.quoteText)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .border(.black, width: 2)
        Spacer()
            Button("Save Quote", action: {
                print("Le captured quote: \($capturedQuote.quoteText)")
            })
        Spacer()
//        }
    }
}

struct CapturedQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CapturedQuoteView()
    }
}
