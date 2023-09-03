//
//  SettingsRowView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/03.
//

import SwiftUI

struct SettingsRowView: View {
    
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(Color.theme.primaryTextColor)
        }
        .padding(4)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(imageName: "bell.circle.fill",
                        title: "Notifications",
                        tintColor: Color(.systemPurple))
    }
}
