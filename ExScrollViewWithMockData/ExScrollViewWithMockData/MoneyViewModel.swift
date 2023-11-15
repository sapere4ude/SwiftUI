//
//  MoneyViewModel.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/15/23.
//

import SwiftUI
import Combine

class MoneyViewModel: ObservableObject {
    
    @Published var sortedItems: [Date: [Item]] = [:]
    
    init() {
        updateSortedItems()
    }
    
    func updateSortedItems() {
        sortedItems = Dictionary(grouping: MockData.items) { item in
            Calendar.current.startOfDay(for: item.date)
        }
    }
    
    func addItem(_ item: Item) {
        let key = Calendar.current.startOfDay(for: item.date)
        
        if var existingItems = sortedItems[key] {
            // Append the new item to the existing items for the date
            existingItems.append(item)
            sortedItems[key] = existingItems
        } else {
            // Create a new array with the item for the date
            sortedItems[key] = [item]
        }
    }
}
