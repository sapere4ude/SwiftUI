//
//  ShoppingBag.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import Foundation

class ShoppingBag: ObservableObject {
    
    @Published var items: [ShoppingCartItem] = []

    // TODO: - 지금은 함수를 호출하는 형태로 작업을 진행했음
    // 바꿔야 하는건 선언형으로 변경해야함. bind() 메서드안에 퍼블리셔를 넣는 형식으로다가
    
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
    
    func removeItem(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product == product }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }

    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func calculateTotalQuantity() -> Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
}

struct ShoppingCartItem: Identifiable {
    var id = UUID()
    var product: Product
    var quantity: Int
}
