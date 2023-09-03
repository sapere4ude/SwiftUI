//
//  SavedLocationSearchView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/03.
//

import SwiftUI

struct SavedLocationSearchView: View {
    
    @State private var text = ""
    // TODO: - 왜 StateObject를 사용한걸까?
    @StateObject var viewModel = LocationSearchViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .imageScale(.medium)
                    .padding(.leading)
                
                // TODO: - padding 값을 주석처리해보면서 테스트해보기
                TextField("Search for a location...",
                          text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .padding(.leading)
                    .background(Color(.systemGray5))
                    .padding(.trailing)
            }
            .padding(.top)
            
            Spacer()
            
            LocationSearchResultsView(viewModel: viewModel, config: .saveLocation)
        }
        .navigationTitle("Add Home")
    }
}

struct SavedLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SavedLocationSearchView()
        }
    }
}
