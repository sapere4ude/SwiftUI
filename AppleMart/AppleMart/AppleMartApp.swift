//
//  AppleMartApp.swift
//  AppleMart
//
//  Created by Kant on 2022/06/26.
//

import SwiftUI

@main
struct AppleMartApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AppleStore()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
