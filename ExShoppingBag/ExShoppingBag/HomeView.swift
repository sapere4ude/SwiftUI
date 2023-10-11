//
//  ContentView.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var shoppingBag = ShoppingBag()
    let products: [Product] = Product.mockData()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(products) { product in
                        ProductItemView(product: product, shoppingBag: shoppingBag)
                    }
                }
                .padding()
            }
            .navigationTitle("Apple Store")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ShoppingCartView(shoppingBag: shoppingBag)) {
                        Image(systemName: "cart")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
