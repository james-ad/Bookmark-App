//
//  CapturedQuoteView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/23/22.
//

import SwiftUI

struct CapturedQuoteView: View {
    @EnvironmentObject var capturedQuote: CapturedQuote
    @State private var saveButtonTapped = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextEditor(text: $capturedQuote.text)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .border(.black, width: 2)
                Spacer()
                Button("Save Quote", action: { saveButtonTapped = true })
                NavigationLink(destination: BookSelectionView(), isActive: $saveButtonTapped) { EmptyView() }
                Spacer()
                Spacer()
            }
        }
    }
}

struct CapturedQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CapturedQuoteView()
    }
}
