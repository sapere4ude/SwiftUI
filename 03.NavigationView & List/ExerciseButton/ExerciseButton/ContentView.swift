//
//  ContentView.swift
//  ExerciseButton
//
//  Created by Kant on 2022/09/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        HStack(spacing: 20) {
            // case1
            Button("Button") {
                print("Button1")
            }
            // case2
            Button(action: { print("Button2")}) {
                Text("Button")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
            // case3
            Button(action: { print("Button3") }) {
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 100.0, height: 100.0)
                    .overlay(Text("Button"))
            }.accentColor(.green)
        }
        HStack(spacing: 20) {
            Button(action: { print("Button1") }) {
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 120, height: 120)
            }
            
            Button(action: { print("Button2") }) {
                Image(systemName: "play.cirlce")
                    .imageScale(.large)
                    .font(.largeTitle)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
