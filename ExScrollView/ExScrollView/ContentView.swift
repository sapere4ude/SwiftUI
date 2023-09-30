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
                                                count: verticalSizeClass == .regular ? 1: 4,
                                                spacing: 16)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
//        .scrollTargetBehavior(.paging) // 페이지에 2개씩 보여줌
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}
