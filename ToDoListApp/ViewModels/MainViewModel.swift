//
//  MainViewModel.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import Foundation
import FirebaseAuth

@Observable
class MainViewModel {
    var currentUserId: String = ""
    var isSignedIn = false
    private var handler: AuthStateDidChangeListenerHandle?
    
    func startListening() {
        guard self.handler == nil else {
            return
        }
        
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                self?.isSignedIn = user != nil
            }
        }
    }
}
