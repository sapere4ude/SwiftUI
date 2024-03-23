//
//  FormView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/12/23.
//

import SwiftUI
import Combine
import SwiftData

struct FormView: View {

    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isBottomSheetPresented: Bool = false
    @State private var selectedCategory: String = ""
    @State private var expenseName: String = ""
    @State private var place: String = ""
    @State private var price: String = ""
    @State private var isCreateForm = false
    
    var user: String
    
    var isCreateButtonEnabled: Bool {
        return !selectedCategory.isEmpty && !place.isEmpty && !price.isEmpty
    }
    
    init(user: String) {
        self.user = user
    }
    
    var body: some View {
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
                .disabled(true)
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
            
            Spacer()
            
            VStack {
                HStack(alignment: .center) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("뒤로가기")
                            .fontWeight(.bold)
                    })
                    .frame(width: 170, height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue.opacity(0.1))
                    )
                    Spacer()
                    Button(action: {
                        // TODO: moneyViewModel을 통한 데이터 만들기
                        modelContext.insert(Cost(user: user,
                                                 category: selectedCategory,
                                                 place: place,
                                                 price: (price as NSString).doubleValue))
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("만들기")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    })
                    .disabled(!isCreateButtonEnabled)
                    .frame(width: 170, height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(!isCreateButtonEnabled ? Color.gray.opacity(0.5) : Color.blue.opacity(0.9))
                    )
                }
                .padding()
            }
            .padding(.bottom)
        }
        .padding(.horizontal, 15)
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $isBottomSheetPresented) {
            CategoryView(isPresented: $isBottomSheetPresented, selectedCategory: $selectedCategory)
                .presentationDetents([.height(355)])
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
        )
    }
}

//#Preview {
//    FormView(moneyViewModel: MoneyViewModel())
//}

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
