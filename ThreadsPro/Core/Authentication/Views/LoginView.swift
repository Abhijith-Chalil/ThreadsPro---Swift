//
//  LoginView.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 30/03/25.
//

import SwiftUI

enum LoginFocus: Int, Hashable {
    case email
    case password
}

struct LoginView: View {
    
    @StateObject private var vm = LoginViewModel()
    
    @FocusState private var focusedField: LoginFocus?
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("threads_logo_black").resizable().scaledToFit().frame(width: 120,height: 120).padding()
                VStack {
                    TextField("Enter your email", text: $vm.email)
                        .autocapitalization(.none)
                        .focused($focusedField, equals: .email)
                        .modifier(ThreadsTextFieldViewModifier())
                    SecureField("Enter your password", text: $vm.password)
                        .focused($focusedField, equals: .password)
                        .modifier(ThreadsTextFieldViewModifier())
                }
                NavigationLink {
                    Text("Forgot Password?")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,20)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Button {
                    Task {
                         try await vm.loginUser()
                    }
                } label: {
                    Text("Login")
                        .modifier(ThreadsCommonButtonViewModifier())
                }
                Spacer()
                Divider()
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                }
                .padding(.vertical, 16)
                
            }
        }
    }
}

#Preview {
    LoginView()
}


