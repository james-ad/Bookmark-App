//
//  Bookmark_AppApp.swift
//  Bookmark App
//
//  Created by James Dunn on 12/17/21.
//

import SwiftUI

@main
struct Bookmark_App: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var store = testStore
    @StateObject var capturedQuote = CapturedQuote()
    @StateObject private var cameraLauncher = CameraLauncher()
    
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            //            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            TabView {
                MainView(delegate: QuoteCaptureViewController())
                    .tabItem {
                        VStack {
                            Image(systemName: "camera")
                            Text("Capture Quote")
                        }
                    }
                LibraryView()
                    .tabItem {
                        VStack {
                            Image(systemName: "books.vertical")
                            Text("Library")
                        }
                    }
                BookSearch()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }
            }
            .environmentObject(cameraLauncher)
            .environmentObject(capturedQuote)
            .environmentObject(store)
        }
    }
}
