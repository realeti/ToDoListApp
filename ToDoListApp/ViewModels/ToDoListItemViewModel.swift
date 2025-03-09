//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import Foundation

/// ViewModel for single to do list item view (each row in items list)
@Observable
class ToDoListItemViewModel {
    init() {}
    
    func toggleIsDone(_ item: ToDoListItem) {
        print("toggleIsDone")
    }
}
