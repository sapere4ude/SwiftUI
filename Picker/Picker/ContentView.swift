//
//  ContentView.swift
//  Picker
//
//  Created by Kant on 2023/07/01.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}

struct ContentView: View {
    
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    var body: some View {
        List {
            Picker("Flavor", selection: $suggestedTopping) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                        .tag(flavor.suggestedTopping)
                }
            }
            HStack {
                Text("Suggested Topping")
                Spacer()
                Text(suggestedTopping.rawValue.capitalized)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
