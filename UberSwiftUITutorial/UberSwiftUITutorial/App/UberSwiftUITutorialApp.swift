//
//  UberSwiftUITutorialApp.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/03/16.
//

import SwiftUI

@main
struct UberSwiftUITutorialApp: App {
    
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
