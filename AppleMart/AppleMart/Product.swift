//
//  Product.swift
//  AppleMart
//
//  Created by Kant on 2022/06/26.
//

import Foundation

struct Product {
    let name: String
    let imageName: String
    let price: Int
    let description: String
    var isFavorite: Bool = false
}

let productSamples = [
    Product(name: "iPhone14 Pro", imageName: "iPhone", price: 1200000, description: "가을 신상"),
    Product(name: "iPad mini", imageName: "iPadMini", price: 7000000, description: "필요는 없지만 사고싶다"),
    Product(name: "AirPod Pro", imageName: "AirPod", price: 300000, description: "신형 에어팟 3세대 프로", isFavorite: true),
    Product(name: "MacBook Pro", imageName: "MacBook", price: 45000000, description: "고오급 노트북"),
    Product(name: "Apple Pencil", imageName: "ApplePencil", price: 200000, description: "필기를 끄적끄적", isFavorite: true)
]
