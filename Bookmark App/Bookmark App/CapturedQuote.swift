//
//  CapturedQuote.swift
//  Bookmark App
//
//  Created by James Dunn on 3/25/22.
//

import Combine

@MainActor class CapturedQuote: ObservableObject {
    @Published var quoteText: String = ""
    
    init(quotedText: String = "") {
        self.quoteText = quotedText
    }
}
