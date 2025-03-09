//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

/// ViewModel for single to do list item view (each row in items list)
@Observable
class ToDoListItemViewModel {
    init() {}
    
    func toggleIsDone(_ item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
