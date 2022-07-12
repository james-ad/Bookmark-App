//
//  StorageManager.swift
//  Bookmark App
//
//  Created by James Dunn on 5/30/22.
//

import CoreData
import Foundation
// TODO: Work on setting up persistent storage after authentication so we can see what identifier is being associated with a user/session

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookmark")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
