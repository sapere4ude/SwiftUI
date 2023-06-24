//
//  LoadingView.swift
//  MoviesApp
//
//  Created by Kant on 2023/06/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
//        Text("Loading...")
//            .font(.largeTitle)
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
