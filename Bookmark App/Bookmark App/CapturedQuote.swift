//
//  CapturedQuote.swift
//  Bookmark App
//
//  Created by James Dunn on 3/25/22.
//

import Combine

class CapturedQuote: ObservableObject {
    @Published var text: String = ""
    
    init(quotedText: String = "") {
        self.text = quotedText
    }
}
