//
//  ContentView.swift
//  DatePicker
//
//  Created by Kant on 2023/07/01.
//

// https://developer.apple.com/documentation/swiftui/datepicker

import SwiftUI

struct ContentView: View {
    
    @State private var date = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2023, month: 6, day: 1)
        let endComponents = DateComponents(year: 2023, month: 8, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from: startComponents)! ... calendar.date(from: endComponents)!
    }()
    
    var body: some View {
        // 1. 단순 DatePicker 보여주기
//        DatePicker(
//            "Start Date",
//            selection: $date,
//            displayedComponents: [.date]
//        )
//        .padding()
//        .datePickerStyle(.compact)
        
        // 2. 원하는 기간을 커스텀한 DatePicker
//        DatePicker(
//            "Start Date",
//            selection: $date,
//            in: dateRange,
//            displayedComponents: [.date, .hourAndMinute]
//        )
//        .padding()
//        .datePickerStyle(.compact)
        
        // 3. Graphical
        DatePicker(
            "Start Date",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
    }
}

