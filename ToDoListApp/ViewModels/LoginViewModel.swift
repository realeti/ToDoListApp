//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import FirebaseAuth
import Foundation

@Observable
class LoginViewModel {
    enum ErrorMessage {
        case fieldsNotFilled
        case wrongEmail
        case unknown
        
        var message: String {
            switch self {
            case .fieldsNotFilled:
                return "Please fill in all fields"
            case .wrongEmail:
                return "Please enter valid email"
            case .unknown:
                return "Unknown error"
            }
        }
    }
    
    var email = ""
    var password = ""
    var errorMessage: ErrorMessage?
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = nil
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = ErrorMessage.fieldsNotFilled
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errorMessage = ErrorMessage.wrongEmail
            return false
        }
        
        return true
    }
}
