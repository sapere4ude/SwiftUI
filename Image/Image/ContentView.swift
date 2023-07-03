//
//  ContentView.swift
//  Image
//
//  Created by Kant on 2023/07/03.
//

// https://developer.apple.com/documentation/swiftui/image/resizable(capinsets:resizingmode:)

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("landscape")
                .resizable()
                .scaledToFit()
                .clipShape(Circle().inset(by: 15)) // clipShape 코드가 아랫줄에 있으나 윗줄에 있으나 똑같은 기능을 하는걸로 확인했음.
                .background(.green)
            
            Image("landscape")
                .resizable()
                .scaledToFit()
                .clipShape(Circle().inset(by: 15))
        }
        .padding()
    }
}
