//
//  ContentView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    // MockData에서 생성된 Item 배열을 날짜순으로 정렬
    var sortedItems: [Date: [Item]] {
        Dictionary(grouping: MockData.items) { item in
            Calendar.current.startOfDay(for: item.date)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Image("kant")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                List {
                    ForEach(sortedItems.sorted(by: { $0.key > $1.key }), id: \.key) { date, items in
                        Section(header: Text(formatDate(date: date))) {
                            ForEach(items) { item in
                                HStack {
                                    Text(item.category)
                                    Text(item.place)
                                    Spacer()
                                    Text("\(item.price)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("지출 관리")
            .toolbar {
                NavigationLink(
                    //destination: SpendingView(),
                    destination: FormView(),
                    label: {
                        Text("추가")
                    })
            }
        }

        VStack {
            Text("칸트님이 \n현재까지 사용하신 금액은 총 230,000 입니다.")
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
