//
//  LoginView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/08/31.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                // image and title
                VStack(spacing: -16) {
                    Image("uber-app-icon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFill()
                    
                    Text("UBER")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                
                // input fields
                VStack(spacing: 32) {
                    // input field1
                    VStack(alignment: .leading, spacing: 12) {
                        // title
                        Text("Email Address")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        // text field
                        TextField("name@example.com", text: $email)
                            .foregroundColor(.white)
                        // divider
                        Rectangle()
                            .foregroundColor(Color(.init(white: 1, alpha: 0.3)))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 0.7)
                    }
                    // input field2
                    VStack(alignment: .leading, spacing: 12) {
                        // title
                        Text("Password")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        // text field
                        TextField("Enter your password", text: $password)
                            .foregroundColor(.white)
                        // divider
                        Rectangle()
                            .foregroundColor(Color(.init(white: 1, alpha: 0.3)))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 0.7)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.top)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 28)

                
                // social sign in view
                
                // sign in button
                
                // sign up button
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
