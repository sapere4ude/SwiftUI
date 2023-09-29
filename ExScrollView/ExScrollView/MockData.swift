//
//  MockData.swift
//  ExScrollView
//
//  Created by Kant on 9/29/23.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let color: Color
}

struct MockData {
    static var items = [Item(color: .teal),
                        Item(color: .pink),
                        Item(color: .indigo),
                        Item(color: .orange),
                        Item(color: .purple),
                        Item(color: .green),
                        Item(color: .yellow),
                        Item(color: .brown),
                        Item(color: .red)]
}
