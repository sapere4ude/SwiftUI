//
//  SideMenuOptionView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/02.
//

import SwiftUI

struct SideMenuOptionView: View {
    
    let viewModel: SideMenuOptionViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: viewModel.imageName)
                    .font(.title2)
                    .imageScale(.medium)
                
                Text(viewModel.title)
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
            }
        }
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .trips)
    }
}
