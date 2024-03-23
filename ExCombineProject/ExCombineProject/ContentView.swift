//
//  ContentView.swift
//  ExCombineProject
//
//  Created by Kant on 2023/09/28.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var items: [String] = ["요거트","사과","아이폰","에어팟"]
    @Published var selectedItem: String = ""
    
    private var cancellable: AnyCancellable?
    
    init() {
        // selectedItem을 items에 할당
        cancellable = $selectedItem
            .assign(to: \.items, on: self)
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.items, id: \.self) { item in
                Text(item)
            }
        }
    }
}
