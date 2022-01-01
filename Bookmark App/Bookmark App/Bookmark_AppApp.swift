//
//  Bookmark_AppApp.swift
//  Bookmark App
//
//  Created by James Dunn on 12/17/21.
//

import SwiftUI

@main
struct Bookmark_AppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            //            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            TabView {
                MainView()
                    .tabItem {
                        VStack {
                            Image(systemName: "camera")
                            Text("Capture Quote")
                        }
                    }
            }
        }
    }
}
