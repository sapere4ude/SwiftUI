//
//  ContentView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var costs: [Cost]
    
    @ObservedObject var moneyViewModel: MoneyViewModel

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(groupedCosts, id: \.0) { date, costsInDate in
                        Section(header: Text(formatDate(date: date))) {
                            ForEach(costsInDate, id: \.id) { cost in
                                HStack {
                                    Text(cost.category)
                                    Text(cost.place)
                                    Spacer()
                                    Text("\(cost.price)")
                                }
                            }
                        }
                    }
                    .listRowBackground(Color.white)
                }
            }
            .toolbar {
                NavigationLink(
                    destination: FormView(moneyViewModel: moneyViewModel),
                    label: {
                        Text("추가")
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    })
            }
            .navigationBarTitle("", displayMode: .inline) // 넘어갔을때 빈영역 생기지 않게
        }
    }
    
    var groupedCosts: [(Date, [Cost])] {
        let groupedDictionary = Dictionary(grouping: costs, by: { date in
            // You may want to adjust the granularity based on your needs
            Calendar.current.startOfDay(for: date.date)
        })
        
        // Sort the keys (dates) in descending order
        let sortedKeys = groupedDictionary.keys.sorted(by: >)
        
        // Create a tuple array with sorted dates and corresponding costs
        return sortedKeys.map { key in
            (key, groupedDictionary[key]!)
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
