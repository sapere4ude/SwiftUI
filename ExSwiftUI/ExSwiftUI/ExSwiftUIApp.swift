//
//  ExSwiftUIApp.swift
//  ExSwiftUI
//
//  Created by Kant on 1/14/24.
//

import SwiftUI

@main
struct ExSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let videoAd = VideoAd.init()
            let vm = ViewModel(text: videoAd)
            ContentView(vm: vm)
        }
    }
}
