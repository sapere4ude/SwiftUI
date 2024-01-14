//
//  ContentView.swift
//  ExSwiftUI
//
//  Created by Kant on 1/14/24.
//

import SwiftUI

struct VideoAd {
    let url = "https://www.afreecatv.com"
}

struct ContentView: View {
    
    @State var vm: ViewModel?
    
    var body: some View {
        VStack {
            LiveVideoView(video: $vm.text)
            Button("텍스트 숨기기") {
                vm = nil
            }
        }
    }
}

struct LiveVideoView: View {
    
    @Binding var video: VideoAd
    
    var body: some View {
        Text(video.url)
    }
}
