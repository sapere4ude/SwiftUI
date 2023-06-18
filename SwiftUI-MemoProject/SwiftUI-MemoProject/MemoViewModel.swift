//
//  MemoViewModel.swift
//  SwiftUI-MemoProject
//
//  Created by Kant on 2023/06/17.
//

import Foundation
import Combine

class MemoViewModel: ObservableObject {
    @Published var memos: [Memo] = []
    
    func addMemo(title: String, content: String) {
        let memo = Memo(title: title, content: content)
        memos.append(memo)
    }
    
    func updateMemo(memo: Memo, title: String, content: String) {
        if let index = memos.firstIndex(where: { $0.id == memo.id }) {
            memos[index].title = title
            memos[index].content = content
        }
    }
    
    func deleteMemo(memo: Memo) {
        memos.removeAll(where: { $0.id == memo.id })
    }
}

