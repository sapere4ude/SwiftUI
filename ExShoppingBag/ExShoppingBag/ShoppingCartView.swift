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
            VStack(spacing: 0) {
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
                        HStack {
                            Spacer()
                            Text("￦" + "1,000,000,000,000")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(height: 70)
                                .padding(.trailing, 10)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray)
                }
                VStack {
                    Text("ORDER")
                        .padding(.top, -10)
                        .frame(height: 70)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
        }
    }
}
