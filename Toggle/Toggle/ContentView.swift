//
//  ContentView.swift
//  Toggle
//
//  Created by Kant on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var vibrateOnRing = false
    @State private var vibrateOnSilent = false
    
    var body: some View {
//        VStack {
//            // 방법 1
//            Toggle(isOn: $vibrateOnRing) {
//                Text("Vibrate on Ring")
//            }
//            // 방법 2
//            Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
//        }
        
        // 방법 3
        VStack {
            Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
            Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
        }
        .toggleStyle(.switch)
        .onChange(of: [vibrateOnRing, vibrateOnSilent], perform: { newValue in
            print("[vibrateOnRing, vibrateSilent]: \(newValue)")
        })
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
