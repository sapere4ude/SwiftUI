//
//  TLButton.swift
//  ToDoList
//
//  Created by Kant on 3/16/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void // TODO: - 이렇게 클로저를 받을 수 있는 구조로 만들기
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value",
             background: .pink) {
        // Action
    }
}
