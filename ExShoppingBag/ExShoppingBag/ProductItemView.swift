//
//  ProductItemView.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import SwiftUI

struct ProductItemView: View {
    
    let product: Product
    @ObservedObject var shoppingBag: ShoppingBag

    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            Text(product.name)
                .font(.headline)
                .multilineTextAlignment(.center)
            Text("\(product.price.formatted(.currency(code: "KRW")))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Button(action: {
                shoppingBag.addItem(product)
            }) {
                Text("장바구니에 추가")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
