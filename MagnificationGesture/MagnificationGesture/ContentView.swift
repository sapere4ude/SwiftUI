//
//  ContentView.swift
//  MagnificationGesture
//
//  Created by Kant on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
            .font(.title)
            .padding(40)
            .background(Color.red.cornerRadius(10))
            .gesture(
                //LongPressGesture()
                MagnificationGesture()
                    .on
            )
    }
}

#Preview {
    ContentView()
}
