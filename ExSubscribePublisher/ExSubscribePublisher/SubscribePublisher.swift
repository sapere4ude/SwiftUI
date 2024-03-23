//
//  ContentView.swift
//  ExSubscribePublisher
//
//  Created by Kant on 10/8/23.
//

import SwiftUI
import Combine

struct SubscribePublisher: View {
    @State private var data: String = "🌧️"
    
    let somePublisher = Just("🌈")
    
    var body: some View {
        Text(data)
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
    }
}


#Preview {
    SubscribePublisher()
}
