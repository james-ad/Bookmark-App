//
//  CapturedQuoteView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/23/22.
//

import SwiftUI

struct CapturedQuoteView: View {
    @State var image: UIImage
    @State var capturedQuote: String = "Hello, World" {
        didSet {
            print("capturedQuote: \(capturedQuote)")
        }
    }
    var stringText: String = "" {
        didSet {
            print("WAAAAAAAA: \(capturedQuote)")
        }
    }
    var body: some View {
//        NavigationView {
        Spacer()
            TextEditor(text: $capturedQuote)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .border(.black, width: 2)
        Spacer()
            Button("Save Quote", action: {
                print("Le captured quote: \($capturedQuote)")
                print("OEHWO: \(stringText)")
            })
        Spacer()
//        }
    }
}

struct CapturedQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CapturedQuoteView(image: UIImage(), capturedQuote: "Hola, World")
    }
}
