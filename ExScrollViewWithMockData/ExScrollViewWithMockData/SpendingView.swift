//
//  SpendingView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/12/23.
//

import SwiftUI

struct SpendingView: View {
    
    @State private var isChecked = false
    
    var body: some View {
        List {
            HStack {
                Text("카페")
                Spacer()
                Button(action: {
                    isChecked.toggle()
                    // Your additional actions when the button is tapped
                }) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                        .foregroundColor(isChecked ? .green : .primary)
                        .imageScale(.large)
                }
            }
            HStack {
                Text("밥집")
                Spacer()
                Button(action: {
                    isChecked.toggle()
                    // Your additional actions when the button is tapped
                }) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                        .foregroundColor(isChecked ? .green : .primary)
                        .imageScale(.large)
                }
            }
            HStack {
                Text("술집")
                Spacer()
                Button(action: {
                    isChecked.toggle()
                    // Your additional actions when the button is tapped
                }) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                        .foregroundColor(isChecked ? .green : .primary)
                        .imageScale(.large)
                }
            }
            
            // TODO: 어떤 항목에서 체크마크가 눌리는지 확인해야하고 완료 눌렀을땐 선택했던 카테고리가 저장된 상태여야함
        }
        .navigationBarTitle("카테고리를 선택해주세요")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink(
                destination: SpendingView(),
                label: {
                    Text("완료")
                        .disabled(!isChecked)
                })
        }
    }
}

#Preview {
    SpendingView()
}
