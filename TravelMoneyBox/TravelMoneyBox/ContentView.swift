//
//  ContentView.swift
//  TravelMoneyBox
//
//  Created by Kant on 2023/07/16.
//

import SwiftUI

struct CountrySelectionView: View {
    @State private var selectedCountries: Set<String> = []
    
    let countriesFlag: [String: String] = [
        "🇺🇸": "미국",
        "🇯🇵": "일본",
        "🇻🇳": "베트남",
        "🇹🇭": "태국",
        "🇵🇭": "필리핀"
    ]
    
    let countriesCode: [String: String] = [
        "🇺🇸": "USD",
        "🇯🇵": "JPY",
        "🇻🇳": "VND",
        "🇹🇭": "THB",
        "🇵🇭": "PHP"
    ]
    

    var body: some View {
        VStack(spacing: 0) {
            Text("원하는 국가를 선택하세요.")
                .font(.headline)
                .padding()

            List(Array(countriesFlag.keys).sorted(), id: \.self) { emoji in
                HStack {
                    Text(emoji)
                        .font(.largeTitle)
                    Text(countriesFlag[emoji] ?? "")
                        .font(.headline)
                    Spacer()
                    if selectedCountries.contains(countriesFlag[emoji] ?? "") {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    toggleSelection(for: countriesFlag[emoji] ?? "")
                }
            }
            .listStyle(.insetGrouped)

            Spacer()
            
            Button(action: {
                generateReceipt()
            }) {
                Text("다음")
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.horizontal, 0)
        }
        .padding()
    }
    
    func toggleSelection(for country: String) {
        selectedCountries.removeAll()
        selectedCountries.insert(country)
    }
    
    func generateReceipt() {
//        if selectedCountries.isEmpty {
//            print("국가를 선택하세요.")
//        } else {
//            let selectedCountryList = selectedCountries.sorted().joined(separator: ", ")
//            print("\(selectedCountryList) 국가의 구매 내역 영수증이 생성되었습니다.")
//        }
    }
}

struct ContentView: View {
    var body: some View {
        CountrySelectionView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
