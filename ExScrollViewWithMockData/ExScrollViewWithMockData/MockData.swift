//
//  MockData.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let date: Date
    let category: String
    let place: String
    let price: Double
    let memo: String?
}

struct MockData {
    static var items: [Item] {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!

        var currentDate = Date()
        
        return [
            Item(date: currentDate.addingTimeInterval(86400), category: "카페", place: "블루보틀", price: 150, memo: "카페라떼마심"),
            Item(date: currentDate.addingTimeInterval(86400 * 2), category: "밥집", place: "이치란라멘", price: 300, memo: "차슈추가해서 먹음"),
            Item(date: currentDate.addingTimeInterval(86400 * 3), category: "술집", place: "야키니꾸", price: 500, memo: "너무 맛있게 먹음"),
            Item(date: currentDate.addingTimeInterval(86400 * 4), category: "관람", place: "호암미술관", price: 200, memo: "박물관은 재밌다"),
            Item(date: currentDate.addingTimeInterval(86400 * 4), category: "술집", place: "야키토리", price: 1000, memo: "고구마쇼주 맛나다"),
            Item(date: currentDate.addingTimeInterval(86400 * 4), category: "쇼핑", place: "나나미카", price: 2000, memo: "나나미카 옷 샀다"),
            Item(date: currentDate.addingTimeInterval(86400 * 4), category: "기념품", place: "돈키호테", price: 480, memo: "냉장고 자석..?"),
            Item(date: currentDate.addingTimeInterval(86400 * 4), category: "커피", place: "%커피", price: 200, memo: "도쿄라떼 맛있다"),
            Item(date: currentDate.addingTimeInterval(86400 * 4), category: "체험", place: "도고온천", price: 300, memo: "따뜻해서 좋네"),
        ]
    }
}
