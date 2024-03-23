//
//  SubscribePublisher3.swift
//  ExSubscribePublisher
//
//  Created by Kant on 10/8/23.
//

import SwiftUI
import Combine

struct DataPublisherModifier: ViewModifier {
    
    @State private var data: String = "🌧️"
    let somePublisher = Just("🌈")

    func body(content: Content) -> some View {
        content
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    somePublisher
                        .sink { newData in
                            withAnimation {
                                self.data = newData
                            }
                        }
                        .cancel()
                }
            }
            .overlay(Text(data)
            .font(.title)
            .foregroundColor(.white))
    }
}

struct SubscribePublisher3: View {
    var body: some View {
        Text("Rainy Day")
            .modifier(DataPublisherModifier())
    }
}

#Preview {
    SubscribePublisher3()
}
