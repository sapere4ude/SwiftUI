//
//  HeaderView.swift
//  ToDoList
//
//  Created by Kant on 3/16/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtile: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                Text(subtile)
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_PreView: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title",
                   subtile: "subtitle",
                   angle: 15,
                   background: .blue)
    }
}
