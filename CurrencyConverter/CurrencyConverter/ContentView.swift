//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Kant on 2023/07/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var input = "100"
    @State var base = "USD"
    @State var currencyList = [String]()
    @FocusState private var inputIsFocused: Bool
    
    func makeRequest(showAll: Bool, input: String, currencies: [String] = ["USD", "KRW", "JPY"]) {
        var tempList = [String]()
        
        apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount\(input)") { currency in
            print(#fileID, #function, #line, "input:\(input)")
            for currency in currency.rates {
                if showAll {
                    tempList.append("\(currency.key) \(String(format: "%.2f", currency.value))")
                } else if currencies.contains(currency.key) {
                    tempList.append("\(currency.key) \(String(format: "%.2f", currency.value))")
                }
                tempList.sort()
            }
            
            currencyList.self = tempList
            print(tempList)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Currencies")
                    .font(.system(size: 30))
                    .bold()
                Image(systemName: "eurosign.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
            }
            List {
                ForEach(currencyList, id: \.self) { currency in
                    Text(currency)
                }
            }
            
            VStack {
                Rectangle()
                    .frame(height: 8.0)
                    .foregroundColor(.blue)
                    .opacity(0.90)
                TextField("Enter an amount", text: $input)
                    .padding()
                    .background(Color.gray.opacity(0.10))
                    .cornerRadius(20.0)
                    .padding()
                    .keyboardType(.decimalPad)
                    .focused($inputIsFocused)
                
                TextField("Enter a currency", text: $base)
                    .padding()
                    .background(Color.gray.opacity(0.10))
                    .cornerRadius(20.0)
                    .padding()
                    .focused($inputIsFocused)
                
                Button("Convert!") {
                    makeRequest(showAll: false, input: input)
                    //inputIsFocused = false
                }
                .padding()
            }
        }
        .onAppear {
            //makeRequest(showAll: false, input: "500")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
