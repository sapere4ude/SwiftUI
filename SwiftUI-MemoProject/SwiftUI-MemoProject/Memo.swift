//
//  Memo.swift
//  SwiftUI-MemoProject
//
//  Created by Kant on 2023/06/17.
//

import Foundation

class Memo: Identifiable, ObservableObject {
    let id = UUID()
    @Published var title: String
    @Published var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

