//
//  FormView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/12/23.
//

import SwiftUI

struct FormView: View {
    
    @ObservedObject var moneyViewModel: MoneyViewModel
    
    @State private var isBottomSheetPresented: Bool = false
    @State private var selectedCategory: String = ""
    @State private var expenseName: String = ""
    @State private var place: String = ""
    @State private var price: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    Text("지출내역")
                        .font(.title3)
                        .bold()
                        .padding(.leading, 25)
                        .padding(.bottom, -15)
                    TextField("지출내역을 입력해주세요", text: $place)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.1))
                        )
                        .padding()
                    Text("카테고리")
                        .font(.title3)
                        .bold()
                        .padding(.leading, 25)
                        .padding(.bottom, -15)
                    TextField("카테고리를 선택해주세요", text: $selectedCategory)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.1))
                        )
                        .padding()
                        .onTapGesture {
                            isBottomSheetPresented.toggle()
                        }
                    Text("금액")
                        .font(.title3)
                        .bold()
                        .padding(.leading, 25)
                        .padding(.bottom, -15)
                    TextField("금액을 입력해주세요", text: $price)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.1))
                        )
                        .padding()
                }
                .padding(.horizontal, 15)
                .sheet(isPresented: $isBottomSheetPresented) {
                    CategoryView(isPresented: $isBottomSheetPresented, selectedCategory: $selectedCategory)
                        .presentationDetents([.height(300)])
                }
                
                Spacer()
                
                VStack {
                    HStack(alignment: .center) {
                        Button(action: {}, label: {
                            Text("뒤로가기")
                                .fontWeight(.bold)
                        })
                        .frame(width: 170, height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.1))
                        )
                        Spacer()
                        Button(action: {}, label: {
                            Text("만들기")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        })
                        .frame(width: 170, height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.9))
                        )
                    }
                    .padding()
                }
                .padding(.bottom)
            }
            .onAppear {
                UIApplication.shared.hideKeyboard()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    FormView(moneyViewModel: MoneyViewModel())
}

extension UIApplication {
    func hideKeyboard() {
        guard let window = windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
 }

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
