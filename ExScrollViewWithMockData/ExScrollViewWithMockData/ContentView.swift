//
//  ContentView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Query var costs: [Cost]
    @Environment(\.modelContext) private var modelContext
    
    var user: String

    init(user: String){
        self.user = user
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(groupedCosts, id: \.0) { date, costsInDate in
                    Section(header: HStack {
                        Text(formatDate(date: date))
                        Spacer()
                        Text(totalCostInDate())
                    }){
                        ForEach(costsInDate, id: \.id) { cost in
                            HStack {
                                Text(cost.category)
                                    .foregroundColor(.gray)
                                Text("|")
                                    .foregroundColor(.gray)
                                Text(cost.place)
                                Spacer()
                                Text("\(cost.price, specifier: "%.1f") 円")
                            }
                        }
                        .onDelete { indexSet in
                            deleteCost(at: indexSet)
                        }
                    }
                }
                .listRowBackground(Color.white)
            }
        }
        .navigationBarItems(trailing:
            HStack {
                NavigationLink(
                destination: FormView(user: self.user),
                label: {
                    Text("추가")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                })
            })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
        )
    }
    
    var groupedCosts: [(Date, [Cost])] {
        
        let filteredCosts = costs.filter { cost in
            return cost.user == self.user
        }
        
        let groupedDictionary = Dictionary(grouping: filteredCosts, by: { date in
            Calendar.current.startOfDay(for: date.date)
        })
        
        let sortedKeys = groupedDictionary.keys.sorted(by: >)
        
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
    
    func totalCostInDate() -> String {
        var totalCost: Double = 0.0
        for (_, costsInDate) in groupedCosts {
            totalCost += costsInDate.reduce(0) { $0 + $1.price }
        }
        return "\(round(totalCost * 10) / 10) 円"
    }
    
    private func deleteCost(at indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(costs[index])
            totalCostInDate()
        }
    }
}

//#Preview {
//    ContentView()
//}
