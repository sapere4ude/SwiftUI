//
//  ContentView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var moneyViewModel: MoneyViewModel

    var body: some View {
        NavigationView {
            VStack {
                Image("kant")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("총 지출 금액: \(3000)") // TODO: 전체 금액 합친 값으로 바꾸기
                    .padding(.top, 5)
//                List {
//                    ForEach(moneyViewModel.sortedItems.sorted(by: { $0.key > $1.key }), id: \.key) { date, items in
//                        Section(header: Text(formatDate(date: date))) {
//                            ForEach(items) { item in
//                                HStack {
//                                    Text(item.category)
//                                    Text(item.place)
//                                    Spacer()
//                                    Text("\(item.price)")
//                                }
//                            }
//                        }
//                    }
//                }
            }
            .background(Color.gray.opacity(0.1))
            .navigationBarTitle("지출 관리")
            .toolbar {
                NavigationLink(
                    //destination: SpendingView(),
                    destination: FormView(moneyViewModel: moneyViewModel),
                    label: {
                        Text("추가")
                    })
                
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

//#Preview {
//    ContentView()
//}
