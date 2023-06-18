//
//  AddMemoView.swift
//  SwiftUI-MemoProject
//
//  Created by Kant on 2023/06/17.
//

import SwiftUI
import Combine

struct AddMemoView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MemoViewModel
    
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Content", text: $content)
            }
            .navigationBarTitle("Add Memo")
            .navigationBarItems(trailing: addButton)
        }
    }
    
    private var addButton: some View {
        Button(action: {
            viewModel.addMemo(title: title, content: content)
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Save")
        }
    }
}

