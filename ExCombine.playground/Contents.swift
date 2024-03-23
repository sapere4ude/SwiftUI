import Combine

//let coupangPublisher = ["요거트","사과","아이폰","에어팟"].publisher
//
//coupangPublisher
//    .map { product in
//        return "현재 주문 제품은: " + product
//    }
//    .sink(receiveCompletion: { _ in
//    print("주문목록 처리 완료!")
//}, receiveValue: { product in
//    print(product)
//})

let coupangPublisher = ["요거트","사과","아이폰","에어팟"].publisher

class CoupangSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = Never
    
    //Subscriber에게 Subscription을 전달하여 Subscriber와 Publisher 간의 연결을 설정합니다. Subscription은 Publisher에 의해 생성되며, Subscriber에게 제공됩니다.
    func receive(subscription: Subscription) {
        print("쿠팡Publisher를 Subscriber에게 전달할 준비됨")
        subscription.request(.unlimited)
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("현재 주문 제품은: \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("주문목록 처리 완료!")
    }
}

//coupangPublisher.subscribe(CoupangSubscriber())



class SomeObject {
    var value: String = "" {
        didSet {
            print("SomeObject: \(value)")
        }
    }
}

let object = SomeObject()
_ = coupangPublisher.assign(to: \.value , on: object)
