//
//  CameraLauncher.swift
//  Bookmark App
//
//  Created by James Dunn on 3/31/22.
//

import Combine

class CameraLauncher: ObservableObject {
    @Published var didFinishPickingImage = false
    
    init(didFinishPickingImage: Bool = false) {
        self.didFinishPickingImage = didFinishPickingImage
    }
}
