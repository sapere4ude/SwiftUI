//
//  ShoppingBag.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import Foundation
import Combine

struct ShoppingCartItem: Identifiable {
    var id = UUID()
    var product: Product
    var quantity: Int
}

class ShoppingBag: ObservableObject {
    
    @Published var items: [ShoppingCartItem] = []
    @Published var isOverCount4: Bool = false
    @Published var isOverCount6: Bool = false
    
    private var cancellable: Set<AnyCancellable> = []
    private var previousTotalQuantity: Int?
    
    init() {
        $items
            .map { $0.reduce(0) { $0 + $1.quantity } }
            .sink { [weak self] totalQuantity in
                if let previousValue = self?.previousTotalQuantity {
                    if previousValue == 3 && totalQuantity == 4 {
                        print("Total quantity changed from 3 to 4")
                        self?.isOverCount4 = true
                    } else if previousValue == 5 && totalQuantity == 6 {
                        print("Total quantity changed from 5 to 6")
                        self?.isOverCount6 = true
                    }
                }
                self?.previousTotalQuantity = totalQuantity
            }
            .store(in: &cancellable)
    }
    
    func addItem(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product == product }) {
            items[index].quantity += 1
        } else {
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
    
    func resetItems() {
        items.removeAll()
    }

    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func calculateTotalQuantity() -> Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    func calculateTotalPrice() -> Int {
        return items.reduce(0) { $0 + ($1.quantity * Int($1.product.price)) }
    }
}
