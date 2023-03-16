//
//  HomeView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/03/16.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
