//
//  SideMenuView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/02.
//

import SwiftUI

struct SideMenuView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
            VStack(spacing: 40) {
                // header view
                VStack(alignment: .leading, spacing: 32) {
                    // user info
                    HStack {
                        Image("jaejun")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(user.fullName)
                                .font(.system(size: 16, weight: .bold))
                            Text(user.email)
                                .font(.system(size: 14))
                                .accentColor(Color.theme.primaryTextColor)
                                .opacity(0.77)
                        }
                    }
                    
                    // become a driver
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Do more with your account")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "dollarsign.square")
                                .font(.title2)
                                .imageScale(.medium)
                            Text("Make Money Driving")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(6)
                        }
                    }
                    // option list
                    Rectangle()
                        .frame(width: 296, height: 0.75)
                        .opacity(0.7)
                        .foregroundColor(Color(.separator))
                        .shadow(color: .black.opacity(0.7), radius: 4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                
                VStack {
                    ForEach(SideMenuOptionViewModel.allCases) { viewModel in
                        NavigationLink(value: viewModel) {
                            SideMenuOptionView(viewModel: viewModel)
                                .padding()
                        }
                    }
                }
                .navigationDestination(for: SideMenuOptionViewModel.self) { viewModel in
                    //Text(viewModel.title) // 이렇게 걸어둔 navigation은 HomeView의 NavigationStack 과 연관이 있다. 이렇게 사용하는건 처음봐서 좀 생소한 방법이라 느껴졌음
                    switch viewModel {
                    case .trips:
                        Text("Trips")
                    case .wallet:
                        Text("Wallet")
                    case .settings:
                        SettingsView(user: user)
                    case .messages:
                        Text("Messages")
                    }
                }
                
                Spacer()
            }
            .padding(.top, 32)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SideMenuView(user: dev.mockUser)
        }
    }
}
