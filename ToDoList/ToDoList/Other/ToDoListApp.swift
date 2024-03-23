//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kant on 3/16/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
