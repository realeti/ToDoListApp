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
    @State private var mainViewModel = MainViewModel()
    
    init() {
        FirebaseApp.configure()
        mainViewModel.startListening()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(mainViewModel)
        }
    }
}
