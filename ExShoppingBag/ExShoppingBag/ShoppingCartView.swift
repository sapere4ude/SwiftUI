//
//  ShoppingCartView.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import SwiftUI

struct ShoppingCartView: View {
    
    @ObservedObject var shoppingBag: ShoppingBag

    var body: some View {
        ScrollView {
            ForEach(shoppingBag.items) { item in
                HStack {
                    Image(item.product.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding(.leading, 5)
                    VStack {
                        Text(item.product.name)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                        Text("$\(String(format: "%.2f", item.product.price))")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    HStack {
                        HStack {
                            Button(action: {
                                // TODO: - button action
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25) // 이미지 크기 조정
                                    .background(.white) // Circle 모양의 배경
                                    .foregroundColor(.green)
                                    .clipShape(Circle())
                            }

                            // TODO: - 수량 보여주는걸로 바꾸기
//                            Button("제거") {
//                                if let index = shoppingBag.items.firstIndex(where: { $0.id == item.id }) {
//                                    shoppingBag.removeItem(at: index)
//                                }
//                            }
                            Button("\(item.quantity)") {
                                if let index = shoppingBag.items.firstIndex(where: { $0.id == item.id }) {
                                    shoppingBag.removeItem(at: index)
                                }
                            }
                            Button(action: {
                                // TODO: - button action
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25) // 이미지 크기 조정
                                    .background(.white) // Circle 모양의 배경
                                    .foregroundColor(.red)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(.trailing, 10)
                    Spacer()
                }
            }
        }
    }
}
