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
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
