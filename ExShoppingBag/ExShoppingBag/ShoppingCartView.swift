//
//  ShoppingCartView.swift
//  ExShoppingBag
//
//  Created by Kant on 10/10/23.
//

import SwiftUI
import AlertToast

struct ShoppingCartView: View {
    
    @ObservedObject var shoppingBag: ShoppingBag
    @State private var showToast = false

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
                            Text("\(item.product.price.formatted(.currency(code: "KRW")))")
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
                                        .frame(width: 25, height: 25)
                                        .background(.white)
                                        .foregroundColor(.green)
                                        .clipShape(Circle())
                                }
                                
                                Text("\(item.quantity)")
                                
                                Button(action: {
                                    shoppingBag.removeItem(item.product)
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .background(.white)
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
                        Button(action: {
                            shoppingBag.resetItems()
                        }) {
                            Text("초기화하기")
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                                .padding(.top, 5)
                        }
                        Spacer()
                        Text("총 주문 갯수")
                            .font(.title2)
                        Text("\(shoppingBag.calculateTotalQuantity()) 개")
                            .font(.title2)
                            .frame(alignment: .trailing)
                            .padding(.trailing, 10)
                    }
                    .padding(.top, 15)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Text("\(shoppingBag.calculateTotalPrice().formatted(.currency(code: "KRW")))")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(height: 70)
                                .padding(.trailing, 10)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(Color(UIColor.systemGray5))
                
                VStack {
                    Text("주문하기")
                        .fontWeight(.bold)
                        .padding(.top, -30)
                        .frame(height: 70)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
        }
        .toast(isPresenting: $shoppingBag.isOverCount4) {
            AlertToast(type: .systemImage("exclamationmark.triangle", .yellow),
                       title: "생각하고 담았나요?",
                       subTitle: "월급을 생각했나요?")
        }
        .toast(isPresenting: $shoppingBag.isOverCount6) {
            AlertToast(type: .systemImage("checkmark.circle", .green),
                       title: "장바구니 한도를 초과했습니다.",
                       subTitle: "답이 없네요!")
            
        }
    }
}
