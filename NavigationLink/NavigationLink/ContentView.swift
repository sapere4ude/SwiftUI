//
//  ContentView.swift
//  NavigationLink
//
//  Created by Kant on 2023/07/03.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/navigationlink

struct ContentView: View {
    
    let colors: [Color] = [.mint, .pink, .teal]
    @State private var selection: Color? // Nothing selected by default.
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("벤츠")) {
                    Text("자동차")
                }
                NavigationLink(destination: Text("사과")) {
                    Text("과일")
                }
                NavigationLink(destination: Text("테니스")) {
                    Text("운동")
                }
            }
            .navigationTitle("이것저것 테스트")
        }
        
        NavigationSplitView {
                List(colors, id: \.self, selection: $selection) { color in
                    NavigationLink(color.description, value: color)
                }
                .navigationTitle("Pick a Color")
            } detail: {
                if let color = selection {
                    ColorDetail(color: color)
                } else {
                    Text("Pick a color")
                }
            }
    }
}

struct ColorDetail: View {
    var color: Color

    var body: some View {
        color.navigationTitle(color.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
