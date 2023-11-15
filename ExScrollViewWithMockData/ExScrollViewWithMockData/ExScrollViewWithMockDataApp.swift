//
//  ExScrollViewWithMockDataApp.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI

@main
struct ExScrollViewWithMockDataApp: App {
    
    @StateObject private var moneyViewModel = MoneyViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(moneyViewModel: moneyViewModel)
        }
    }
}
