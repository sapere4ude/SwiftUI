//
//  ExerciseButtonApp.swift
//  ExerciseButton
//
//  Created by Kant on 2022/09/24.
//

import SwiftUI

@main
struct ExerciseButtonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
