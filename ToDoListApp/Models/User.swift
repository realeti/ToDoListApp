//
//  User.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
