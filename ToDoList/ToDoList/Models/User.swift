//
//  User.swift
//  ToDoList
//
//  Created by Kant on 3/16/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
