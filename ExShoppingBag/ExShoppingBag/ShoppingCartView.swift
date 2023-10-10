//
//  ShoppingCartView.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import SwiftUI

struct ShoppingCartView: View {
    
    @ObservedObject var shoppingBag: ShoppingBag

    var body: some View {
        List {
            ForEach(shoppingBag.items) { item in
                HStack {
                    Text(item.product.name)
                    Spacer()
                    Text("$\(String(format: "%.2f", item.product.price))")
                    Text("수량: \(item.quantity)") // 수량 표시
                    Button("제거") {
                        if let index = shoppingBag.items.firstIndex(where: { $0.id == item.id }) {
                            shoppingBag.removeItem(at: index)
                        }
                    }
                }
            }
        }
        .navigationTitle("장바구니")
    }
}
