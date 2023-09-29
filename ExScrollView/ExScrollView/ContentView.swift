//
//  ContentView.swift
//  ExScrollView
//
//  Created by Kant on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 5: 4,
                                                spacing: 16)
                        .foregroundStyle(item.color.gradient)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
