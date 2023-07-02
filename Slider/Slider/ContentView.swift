//
//  ContentView.swift
//  Slider
//
//  Created by Kant on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        // 1. 단순 Slider
//        VStack {
//            Slider(value: $speed, in: 0...100) { editing in
//                isEditing = editing
//            }
//            Text("\(speed)")
//                .foregroundColor(isEditing ? .red : .blue)
//        }
//        .padding()
        
        // 2. 이것저것 추가된 Slider
        VStack {
            Slider(value: $speed,
                   in: 0...100,
                   step: 5
            ) {
                Text("Speed")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            } onEditingChanged: { editing in
                isEditing = editing
            }
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
