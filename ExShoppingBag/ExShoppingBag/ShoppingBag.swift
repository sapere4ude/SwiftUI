//
//  ShoppingBag.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import Foundation

class ShoppingBag: ObservableObject {
    
    @Published var items: [ShoppingCartItem] = []

    func addItem(_ product: Product) {
        // 이미 장바구니에 있는지 확인
        if let index = items.firstIndex(where: { $0.product == product }) {
            // 이미 있는 경우 수량을 증가
            items[index].quantity += 1
        } else {
            // 없는 경우 새로 추가
            items.append(ShoppingCartItem(product: product, quantity: 1))
        }
    }

    func removeItem(at index: Int) {
        items.remove(at: index)
    }
}

struct ShoppingCartItem: Identifiable {
    var id = UUID()
    var product: Product
    var quantity: Int
}
