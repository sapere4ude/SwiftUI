//
//  Product.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import Foundation

struct Product: Identifiable, Equatable {
    
    var id = UUID()
    var name: String
    var price: Double
    var imageName: String // 이미지 이름 추가
    
    init(name: String, price: Double, imageName: String) {
        self.name = name
        self.price = price
        self.imageName = imageName
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
            return lhs.id == rhs.id
        }
    
    static func mockData() -> [Product] {
            return [
                Product(name: "iPhone 15 Pro White", price: 799.99, imageName: "iPhone15ProWhite"),
                Product(name: "iPhone 15 Pro Natural", price: 999.99, imageName: "iPhone15ProNatural"),
                Product(name: "iPhone 15 Yellow", price: 1099.99, imageName: "iPhone15Yellow"),
                Product(name: "iPhone 15 Pink", price: 399.99, imageName: "iPhone15Pink"),
            ]
        }
}
