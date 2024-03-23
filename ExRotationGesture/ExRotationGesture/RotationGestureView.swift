//
//  RotationGestureView.swift
//  ExRotationGesture
//
//  Created by Kant on 12/31/23.
//

import SwiftUI

struct RotationGestureView: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello World!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(.zero)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureView()
}
