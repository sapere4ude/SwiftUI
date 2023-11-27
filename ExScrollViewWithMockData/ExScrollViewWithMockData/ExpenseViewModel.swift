//
//  ExpenseViewModel.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/25/23.
//

import Foundation
import SwiftData

class ExpenseViewModel: ObservableObject {
    
//    @Published var expenseItems: [Date: [ExpenseItem]] = [:]
//    
//    @Environment(\.modelContext) private var context
//    @Query private var items: [ExpenseItem] // local data storage
    
    //@Bindable var expenseItems: [Date: [ExpenseItem]] = [:]
    
    //@Bindable var expenseItems: ExpenseItem
    
    init() {
        updateSortedItems()
    }
    
    func updateSortedItems() {
//        expenseItems = Dictionary(grouping: expenseItems) { item in
//            Calendar.current.startOfDay(for: item.date)
//        }
    }
}
