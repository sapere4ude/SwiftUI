//
//  LoginView.swift
//  ToDoList
//
//  Created by Kant on 3/16/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List",
                           subtile: "Get things done",
                           angle: 15,
                           background: .pink)
                
                // Lgoin Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login",
                             background: .blue,
                             action: {
                        viewModel.login()
                    })
                    
                    .padding() // TODO: - 여기 주석으로 만들고 UI 달라지는거 확인해보기.
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("New around here")
                    NavigationLink("Create An Account") {
                        RegisterView()
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
