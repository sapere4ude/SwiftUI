//
//  DeveloperPreview.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/04.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let mockUser = User(fullName: "jaejun Yoo",
                        email: "test@gmail.com",
                        uid: NSUUID().uuidString,
                        coordinates: GeoPoint(latitude: 37.785834, longitude: -122.406417),
                        accountType: .passenger,
                        homeLocation: nil,
                        workLocation: nil)
}
