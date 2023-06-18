//
//  SwiftUI_MemoProjectApp.swift
//  SwiftUI-MemoProject
//
//  Created by Kant on 2023/06/17.
//

import SwiftUI

@main
struct SwiftUI_MemoProjectApp: App {
    @StateObject private var viewModel = MemoViewModel()
    
    var body: some Scene {
        WindowGroup {
            MemoListView(viewModel: viewModel)
        }
    }
}
