//
//  CameraLauncher.swift
//  Bookmark App
//
//  Created by James Dunn on 3/31/22.
//

import Combine

class CameraLauncher: ObservableObject {
    @Published var didFinishPickingImage = false
    @Published var didSaveQuote = false
    
    init(didFinishPickingImage: Bool = false, didSaveQuote: Bool = false) {
        self.didFinishPickingImage = didFinishPickingImage
        self.didSaveQuote = didSaveQuote
    }
}
