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
        VStack {
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
                                    shoppingBag.addItem(item.product)
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25) // 이미지 크기 조정
                                        .background(.white) // Circle 모양의 배경
                                        .foregroundColor(.green)
                                        .clipShape(Circle())
                                }
                                
                                Text("\(item.quantity)")
                                
                                Button(action: {
                                    // TODO: - button action
                                    shoppingBag.removeItem(item.product)
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
            VStack {
//                HStack(alignment: .top) {
//                    Text("총 주문 갯수")
//                    Spacer()
//                    Button(action: {
//                        // TODO: -
//                    }) {
//                        Text("초기화하기")
//                    }
//                    Text("\(shoppingBag.calculateTotalQuantity()) 개")
//                        .frame(alignment: .trailing)
//                }
//                .frame(maxWidth: .infinity, maxHeight: 100)
//                .background(.pink)
//                VStack {
//                    Text("가격")
//                        .background(.orange)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    Text("주문하기")
//                        .background(.blue)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                }
                
                VStack {
                    HStack {
                        Text("총 주문 갯수")
                        Spacer()
                        Button(action: {
                            // TODO: -
                        }) {
                            Text("초기화하기")
                        }
                        Text("\(shoppingBag.calculateTotalQuantity()) 개")
                            .frame(alignment: .trailing)
                    }
                    VStack {
                        Text("가격")
                            .background(.orange)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                VStack {
                    Text("ORDER")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
        }
    }
}
