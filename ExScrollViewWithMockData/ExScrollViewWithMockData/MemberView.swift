//
//  MemberView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/27/23.
//

import SwiftUI

struct MemberView: View {
    
    var body: some View {
        VStack(spacing: 15) {
            HStack{
                Image("kant")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text("칸트 사용내역 작성하기")
                    .fontWeight(.medium)
                    .font(.title3)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .font(.title)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.blue.opacity(0.1))
            )
            .onTapGesture {

            }
            HStack{
                Image("kant")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text("칸트")
                    .fontWeight(.bold)
                    .font(.title3)
                Text("남은 금액")
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.blue.opacity(0.1))
            )
            HStack{
                Image("kant")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text("칸트")
                    .fontWeight(.bold)
                    .font(.title3)
                Text("남은 금액")
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.blue.opacity(0.1))
            )
            HStack{
                Image("kant")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text("칸트")
                    .fontWeight(.bold)
                    .font(.title3)
                Text("남은 금액")
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.blue.opacity(0.1))
            )
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

#Preview {
    MemberView()
}
