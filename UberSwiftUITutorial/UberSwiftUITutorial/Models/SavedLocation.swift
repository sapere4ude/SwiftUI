//
//  SavedLocation.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/04.
//

import Foundation
import Firebase

struct SavedLocation: Codable {
    let title: String
    let address: String
    let coordinates: GeoPoint
}
