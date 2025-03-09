//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary tab
@Observable
class ToDoListViewModel {
    var showingNewItemView: Bool = false
    
    func delete(id: String, userId: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
