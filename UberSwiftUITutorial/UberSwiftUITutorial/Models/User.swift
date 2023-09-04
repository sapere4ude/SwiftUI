//
//  User.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/02.
//

import Foundation
import Firebase

enum AccountType: Int, Codable {
    case passenger = 0
    case driver = 1
}

struct User: Codable {
    let fullName: String
    let email: String
    let uid: String
    var coordinates: GeoPoint
    let accountType: AccountType
    var homeLocation: SavedLocation?
    var workLocation: SavedLocation?
}
