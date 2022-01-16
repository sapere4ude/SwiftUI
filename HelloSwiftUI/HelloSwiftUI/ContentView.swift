//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Kant on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, swiftUI")
            .font(.largeTitle)
            .foregroundColor(.purple)
            .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
            .padding()
        
        VStack(spacing: 30) {
            Text("폰트의 굵기 설정")
                .font(.title)
                .fontWeight(.black)
            Text("글자색은 foreground, 배경은 background")
                .foregroundColor(.white)
                .padding()
                .background(.blue)
            
            Text("커스텀 폰트, 볼드체, 이텔릭체, 밑줄, 취소선")
                .font(.custom("Menlo", size: 16))
                .bold()
                .italic()
                .underline()
                .strikethrough()
            
            Text("라인 수 제한과 \n 텍스트 정렬 가능입니다. \n 이건 안 보입니다.")
                .lineLimit(2)
                .multilineTextAlignment(.trailing)
                .fixedSize()
            
            Text("자간과 기준선").kerning(8)
            + Text("기준도 쉽게 가능합니다.").baselineOffset(8)
                .font(.system(size: 16))
        }
        
        
        // 수식어를 적용하는 순서에 따라 뷰의 모양이 다르게 보일 수 있다
        Text("🍞🙂⚡️🎯").font(.largeTitle)
            .background(.yellow)
            .padding()
        
        Text("🍞🙂⚡️🎯").font(.largeTitle)
            .padding()
            .background(.yellow)
        
        HStack {
            Image("Apple").resizable().frame(width: 50, height: 50).colorMultiply(.red)
            Image("Apple").resizable().frame(width: 50, height: 50).colorMultiply(.blue)
            Image("Apple").resizable().frame(width: 50, height: 50).colorMultiply(.green)
        }
        
        HStack(spacing:30) {
            Image(systemName: "speaker.3").font(.body)
            Image(systemName: "speaker.3").font(.title)
            Image(systemName: "speaker.3").font(.system(size: 40))
            Image(systemName: "speaker.3").imageScale(.large).font(.system(size: 40))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
