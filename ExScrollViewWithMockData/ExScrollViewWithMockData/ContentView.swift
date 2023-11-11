//
//  ContentView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image("kant")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .clipShape(Circle())
//        }
//        List {
//            Section(header: Text("Header")) {
//                ForEach(0..<5) { index in
//                    Text("\(index): Text")
//                    
//                }
//            }
//        }
//    }
    // MockData에서 생성된 Item 배열을 날짜순으로 정렬
    var sortedItems: [Date: [Item]] {
        Dictionary(grouping: MockData.items) { item in
            Calendar.current.startOfDay(for: item.date)
        }
    }

    var body: some View {
        VStack {
            Image("kant")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
        }
        List {
            ForEach(sortedItems.sorted(by: { $0.key > $1.key }), id: \.key) { date, items in
                Section(header: Text(formatDate(date: date))) {
                    ForEach(items) { item in
                        Text(item.place)
                        // 여기에 다른 항목을 표시하거나 수정하세요
                    }
                }
            }
        }
    }

    // 날짜를 원하는 형식으로 포맷하는 함수
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
