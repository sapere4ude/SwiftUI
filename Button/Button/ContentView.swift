//
//  ContentView.swift
//  Button
//
//  Created by Kant on 2023/07/02.
//

// https://developer.apple.com/documentation/swiftui/button

import SwiftUI

enum Folders: String, CaseIterable, Identifiable {
    case documents, downloads, recents
    var id: Self { self }
}

struct ContentView: View {
    
    @State private var folders: Folders = .documents
    
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]
    
    var body: some View {
        // 1. 버튼 기본 액션
//        VStack {
//            Button("Sign in") {
//                print("did Tap")
//            }
//        }
//        .padding()
        
        // 2. 리스트 버튼
//        List {
//            ForEach(Folders.allCases) { folders in
//                Text(folders.rawValue.capitalized)
//            }
//            Button(action: addItem) { // 임의로 addItem 이라는 함수가 있다고 가정하는 것
//                Label("Add Folder", systemImage: "folder.badge.plus")
//            }
//        }
        
        // 3. 텍스트 롱탭 > contextMenu 호출
//        Text("contextMenu를 테스트합니다")
//            .contextMenu {
//                Button(action: {
//                    setMessage("Copy")
//                }) {
//                    Text("Copy")
//                    Image(systemName: "doc.on.doc")
//                }
//
//                Button(action: {
//                    setMessage("Paste")
//                }) {
//                    Text("Paste")
//                    Image(systemName: "doc.on.clipboard")
//                }
//
//                Button(role: .destructive) {
//                    setMessage("Delete")
//                } label: {
//                    Text("Delete")
//                    Image(systemName: "trash")
//                }
//            }
        
        // 4. 수정 버튼
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete { fruits.remove(atOffsets: $0) }
                .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
            }
            .navigationTitle("Fruits")
            .toolbar {
                EditButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - 테스트를 위한 함수들
extension ContentView {
    func addItem() {
        
    }
    
    func setMessage(_ value: String) {
        //message = "Selected: \(value)"
    }
}
