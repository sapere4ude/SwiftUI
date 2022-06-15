//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Kant on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        Text("Hello, swiftUI")
        //            .font(.largeTitle)
        //            .foregroundColor(.purple)
        //            .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
        //            .padding()
        //
        //        VStack(spacing: 30) {
        //            Text("폰트의 굵기 설정")
        //                .font(.title)
        //                .fontWeight(.black)
        //            Text("글자색은 foreground, 배경은 background")
        //                .foregroundColor(.white)
        //                .padding()
        //                .background(.blue)
        //
        //            Text("커스텀 폰트, 볼드체, 이텔릭체, 밑줄, 취소선")
        //                .font(.custom("Menlo", size: 16))
        //                .bold()
        //                .italic()
        //                .underline()
        //                .strikethrough()
        //
        //            Text("라인 수 제한과 \n 텍스트 정렬 가능입니다. \n 이건 안 보입니다.")
        //                .lineLimit(2)
        //                .multilineTextAlignment(.trailing)
        //                .fixedSize()
        //
        //            Text("자간과 기준선").kerning(8)
        //            + Text("기준도 쉽게 가능합니다.").baselineOffset(8)
        //                .font(.system(size: 16))
        //        }
        //
        //
        //        // 수식어를 적용하는 순서에 따라 뷰의 모양이 다르게 보일 수 있다
        //        Text("🍞🙂⚡️🎯").font(.largeTitle)
        //            .background(.yellow)
        //            .padding()
        //
        //        Text("🍞🙂⚡️🎯").font(.largeTitle)
        //            .padding()
        //            .background(.yellow)
        //
        //        HStack {
        //            Image("Apple").resizable().frame(width: 50, height: 50).colorMultiply(.red)
        //            Image("Apple").resizable().frame(width: 50, height: 50).colorMultiply(.blue)
        //            Image("Apple").resizable().frame(width: 50, height: 50).colorMultiply(.green)
        //        }
        //
        //        HStack(spacing:30) {
        //            Image(systemName: "speaker.3").font(.body)
        //            Image(systemName: "speaker.3").font(.title)
        //            Image(systemName: "speaker.3").font(.system(size: 40))
        //            Image(systemName: "speaker.3").imageScale(.large).font(.system(size: 40))
        //        }
        //
        //        HStack(alignment: .center) {
        //            Rectangle()
        //                .fill(Color.green)
        //                .frame(width: 150, height: 150)
        //            Rectangle()
        //                .fill(Color.yellow)
        //                .frame(width: 150, height: 550)
        //        }
        //
        //        VStack {
        //            Rectangle()
        //                .fill(Color.green)
        //                .frame(width: 150, height: 150)
        //            Rectangle()
        //                .fill(Color.yellow)
        //                .frame(width: 150, height: 150)
        //        }
        //
        //        ZStack {
        //            Rectangle()
        //                .fill(Color.red)
        //                .frame(width: 150, height: 150)
        //                .offset(x:-40, y: -40)
        //            Rectangle()
        //                .fill(Color.blue)
        //                .frame(width: 150, height: 150)
        //                .offset(x:20, y: 20)
        //            Rectangle()
        //                .fill(Color.green)
        //                .frame(width: 150, height: 150)
        //                .offset(x:80, y: 80)
        //        }
        //
        //        HStack {
        //            Text("HStack").font(.title).foregroundColor(Color.pink)
        //            Text("은 뷰를 가로로 배열합니다.")
        //            Text("👻")
        //        }
        //        .padding()
        //        .border(Color.black)
        //        .font(.largeTitle)
        
        //        HStack {
        //            Text("Spacer MinLength").font(.title).background(Color.yellow)
        //            Spacer(minLength: 100)
        //            Text("Spacer").font(.title).background(Color.green)
        //        }.background(Color.blue)
        //
        //        Spacer().background(Color.blue)
        
        // 2022.06.15 수요일
//                ZStack {
//                    Color.clear
//                    Text("Spacer").font(.title).background(Color.yellow)
//                }.background(Color.blue)
//        
//                VStack {
//                    Text("제목").font(.largeTitle)
//                    Text("부제목").font(.largeTitle).foregroundColor(.gray)
//                    Spacer()
//                    Text("본문 내용")
//                    Spacer()
//                    Spacer()
//                    Text("각주").font(.body)
//                    Spacer()
//                }
//                .font(.title)
//                .frame(width: 200, height: 350)
//                .padding()
//                .background(.indigo)
//                .border(Color.blue, width: 2)
//            }
        
        VStack {
            Text("도형 만들기").font(.largeTitle).fontWeight(.heavy)
            
            HStack {
                Text("둥근 모양").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height:10)
                HStack {
                    Circle().fill(Color.yellow)
                    Ellipse().fill(Color.yellow)
                    Capsule().fill(Color.yellow)
                    RoundedRectangle(cornerRadius: 30).fill(Color.green)
                }
            }
            HStack {
                Text("각진 모양").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height:10)
                HStack {
                    Color.red   // SwiftUI에선 컬러 그 자체도 하나의 뷰에 해당함
                    Rectangle().fill(Color.blue)
                    RoundedRectangle(cornerRadius: 0).fill(Color.green)
                }
            }
        }
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
