//
//  ContentView.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
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

// 장바구니 아이콘 및 카운터 표시를 위한 확장
extension ContentView {
    var shoppingCartButton: some View {
        NavigationLink(destination: ShoppingCartView(shoppingBag: shoppingBag)) {
            Image(systemName: "cart")
                .imageScale(.large)
                .overlay(
                    Text("\(shoppingBag.items.count)")
                        .font(Font.system(size: 14).bold())
                        .frame(width: 20, height: 20)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(x: 10, y: -10)
                        .opacity(shoppingBag.items.isEmpty ? 0 : 1)
                )
        }
    }
}

#Preview {
    ContentView()
}
