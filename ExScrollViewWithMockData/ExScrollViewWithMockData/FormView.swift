//
//  FormView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/12/23.
//

import SwiftUI

struct FormView: View {
    
    @State private var isBottomSheetPresented = false
    
    var body: some View {
        VStack {
            Text("Click me!")
                .onTapGesture {
                    isBottomSheetPresented.toggle()
                }
        }
        .sheet(isPresented: $isBottomSheetPresented) {
            CategoryView(isPresented: $isBottomSheetPresented)
                .presentationDetents([.height(300)])
        }
    }
}

#Preview {
    FormView()
}
