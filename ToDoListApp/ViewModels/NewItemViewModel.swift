//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import Foundation

@Observable
class NewItemViewModel {
    var title: String = ""
    var dueDate = Date()
    var showAlert = false
    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
