//
//  Bookmark_AppApp.swift
//  Bookmark App
//
//  Created by James Dunn on 12/17/21.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    return true
  }
}

@main
struct Bookmark_App: App {
    // Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var dataController = DataController()
    @StateObject private var store = testStore
    @StateObject private var capturedQuote = CapturedQuote()
    @StateObject private var cameraLauncher = CameraLauncher()
    
    var body: some Scene {
        WindowGroup {
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
            .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
