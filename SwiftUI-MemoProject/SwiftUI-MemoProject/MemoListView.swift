//
//  MemoListView.swift
//  SwiftUI-MemoProject
//
//  Created by Kant on 2023/06/17.
//

import SwiftUI

struct MemoListView: View {
    @ObservedObject var viewModel: MemoViewModel
    
    @State private var isShowingAddMemoView = false
    
    var body: some View {
//        NavigationView {
//            List(viewModel.memos) { memo in
//                NavigationLink(destination: MemoDetailView(memo: memo, viewModel: viewModel)) {
//                    Text(memo.title)
//                }
//            }
//            .navigationBarTitle("Memos")
//            .navigationBarItems(trailing: addButton)
//        }
        
        VStack {
            TestContentView(content: "")
            TestScrollView(content: "스크롤뷰가 어떤식으로 들어갈까나??")
            Spacer()
        }
        .padding()
    }
    
    private var addButton: some View {
        Button(action: {
            isShowingAddMemoView = true
        }) {
            Image(systemName: "plus")
        }
        .sheet(isPresented: $isShowingAddMemoView) {
            AddMemoView(viewModel: viewModel)
        }
    }
}

struct TestContentView: View {
    var content: String
    
    init(content: String) {
        self.content = content
    }
    var body: some View {
        GroupBox(label: HStack {
            Text(content)
            Spacer()
            Button(action: {
                // 버튼 클릭 이벤트 처리
                print("Button tapped")
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }) {
            Text("새로운 뷰 만들러 가기")
                .padding()
        }
        .groupBoxStyle(GreenGroupBoxStyle())
    }
}

struct TestScrollView: View {
    var content: String
    
    init(content: String) {
        self.content = content
    }
    var body: some View {
        GroupBox(label: HStack {
            Text(content)
            Spacer()
            Button(action: {
                // 버튼 클릭 이벤트 처리
                print("Button tapped")
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 300, height: 400)
                            .shadow(radius: 10)
                            .padding()
                    }
                }
            }
        }
    }
}

struct GreenGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            configuration.content
        }
        .padding()
        .background(Color.yellow) // GroupBox 전체 백그라운드 색상을 green으로 지정
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
