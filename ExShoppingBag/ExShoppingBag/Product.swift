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
                Product(name: "iPhone 15 Pro White 256G", price: 1700000, imageName: "iPhone15ProWhite"),
                Product(name: "iPhone 15 Pro Max Natural 512G", price: 2200000, imageName: "iPhone15ProNatural"),
                Product(name: "iPhone 15 Yellow 128G", price: 1250000, imageName: "iPhone15Yellow"),
                Product(name: "iPhone 15 Plus Pink 512G", price: 1800000, imageName: "iPhone15Pink"),
            ]
        }
}
