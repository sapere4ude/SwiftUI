//
//  MemberView.swift
//  ExScrollViewWithMockData
//
//  Created by Kant on 11/27/23.
//

import SwiftUI
import SwiftData

struct MemberView: View {
    
    @Query var costs: [Cost]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("松山 旅行 ⛰️")
                    .font(.title)
                    .fontWeight(.bold)
                MemberDesignView(user: "드웨인")
                MemberDesignView(user: "보름")
                MemberDesignView(user: "칸트")
                MemberDesignView(user: "타피")
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
        .navigationBarTitle("", displayMode: .inline) // 넘어갔을때 빈영역 생기지 않게
    }
}

struct MemberDesignView: View {
    
    @Query var costs: [Cost]
    var user: String
    
    init(user: String) {
        self.user = user
    }
    var body: some View {
        HStack{
            Image("\(user)")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("\(user)")
                    .fontWeight(.bold)
                    .font(.title3)
                Text("총 사용 금액 " + showCost("\(user)"))
            }
            Spacer()
            NavigationLink(
                destination: ContentView(user: "\(user)"),
                label: {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                })
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.blue.opacity(0.1))
        )
    }
    
    func showCost(_ user: String) -> String {
        let kantCosts = costs.filter { $0.user == user }
        let total = kantCosts.reduce(0) { $0 + $1.price }
        let cost = round(total * 10) / 10
        return " \(cost) 円"
    }
}

//#Preview {
//    MemberView()
//}
