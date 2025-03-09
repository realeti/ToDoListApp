//
//  ToDoListApp.swift
//  ToDoListApp
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(MainViewModel())
        }
    }
}

/*class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}*/
