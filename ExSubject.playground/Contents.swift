import Combine
import Foundation

// PassthroughSubject 예제
//let passthroughSubject = PassthroughSubject<String, Never>()
//
//let passthroughSubscriber1 = passthroughSubject.sink { value in
//    print("Subscriber 1 received value: \(value)")
//}
//
//passthroughSubject.send("🍡")
//passthroughSubject.send("🌾")
//
//let passthroughSubscriber2 = passthroughSubject.sink { value in
//    print("Subscriber 2 received value: \(value)")
//}
//
//passthroughSubject.send("🥮")

// CurrentValueSubject 예제
//let currentValueSubject = CurrentValueSubject<String, Never>("Initial Value")
//
//let currentValueSubscriber1 = currentValueSubject.sink { value in
//    print("Subscriber 1 received value: \(value)")
//}
//
//currentValueSubject.send("🍁")
//
//let currentValueSubscriber2 = currentValueSubject.sink { value in
//    print("Subscriber 2 received value: \(value)")
//}
//
//currentValueSubject.send("🌕")

// Product 모델 정의
struct Product {
    let name: String
}

// 초기 제품 목록
let initialProducts = [
    Product(name: "iPhone14"),
    Product(name: "AirPods2"),
    Product(name: "MacBookPro"),
    Product(name: "MacBookAir")
]

// CurrentValueSubject를 사용하여 제품 목록을 저장하고 공유합니다.
var productSubject = CurrentValueSubject<[Product], Never>(initialProducts)

// 현재 제품 목록을 출력
print("🍎 현재 Apple 제품 목록")
print(productSubject.value.map { $0.name })

// 새로운 제품을 추가하여 제품 목록을 업데이트합니다.
let newProduct = Product(name: "iPhone15ProMax")
productSubject.send(productSubject.value + [newProduct])

// 업데이트된 제품 목록을 출력
print("🍏 업데이트된 제품 목록")
print(productSubject.value.map { $0.name })
