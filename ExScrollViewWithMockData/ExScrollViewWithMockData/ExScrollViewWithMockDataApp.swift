//
//  ExScrollViewWithMockDataApp.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI
import SwiftData

@main
struct ExScrollViewWithMockDataApp: App {
    
    @StateObject private var moneyViewModel = MoneyViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(moneyViewModel: moneyViewModel)
            //FormView(moneyViewModel: moneyViewModel)
        }
        .modelContainer(for: Cost.self)
    }
}
