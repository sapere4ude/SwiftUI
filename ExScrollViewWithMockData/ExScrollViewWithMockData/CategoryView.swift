//
//  CategoryView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/12/23.
//

import SwiftUI

struct CategoryView: View {
    
    @Binding var isPresented: Bool
    @Binding var selectedCategory: String
    
    let categories = ["☕️ 카페", "🍱 밥집", "🍻 술집", "🛍️ 쇼핑", "🎟️ 관람"]
    
    var body: some View {
        ForEach(categories, id: \.self) { category in
            Button(action: {
                selectedCategory = category
            }) {
                HStack {
                    Text(category)
                        .padding()
                        .foregroundColor(.black)
                    Spacer()
                    if selectedCategory == category {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .padding()
                        
                    }
                }
            }
        }
    }
}

//#Preview {
//    CategoryView(isPresented: .constant(true))
//}
