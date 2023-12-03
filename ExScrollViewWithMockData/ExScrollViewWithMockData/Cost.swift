//
//  Cost.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/26/23.
//

import Foundation
import SwiftData

@Model
class Cost: Identifiable {
    @Attribute(.unique) var id = UUID()
    var user: String
    var date: Date
    var category: String
    var place: String
    var price: Double
    
    init(user: String,
         category: String,
         place: String,
         price: Double) {
        self.user = user
        self.date = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
        self.category = category
        self.place = place
        self.price = price
    }
}
