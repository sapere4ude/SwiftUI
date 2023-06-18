//
//  MemoDetailView.swift
//  SwiftUI-MemoProject
//
//  Created by Kant on 2023/06/17.
//

import SwiftUI

struct MemoDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var memo: Memo
    @ObservedObject var viewModel: MemoViewModel
    
    @State private var title: String
    @State private var content: String
    
    init(memo: Memo, viewModel: MemoViewModel) {
        self.memo = memo
        self.viewModel = viewModel
        _title = State(initialValue: memo.title)
        _content = State(initialValue: memo.content)
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Content", text: $content)
        }
        .navigationBarTitle("Edit Memo")
        .navigationBarItems(trailing: saveButton)
    }
    
    private var saveButton: some View {
        Button(action: {
            viewModel.updateMemo(memo: memo, title: title, content: content)
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Save")
        }
    }
}

