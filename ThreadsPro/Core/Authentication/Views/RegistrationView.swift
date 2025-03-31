//
//  RegistrationView.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 30/03/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var vm = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("threads_logo_black").resizable().scaledToFit().frame(width: 120,height: 120).padding()
            VStack {
                TextField("Enter your email", text: $vm.email)
                    .modifier(ThreadsTextFieldViewModifier())
                SecureField("Enter your password", text: $vm.password)
                    .modifier(ThreadsTextFieldViewModifier())
                TextField("Enter your full name", text: $vm.fullName)
                    .modifier(ThreadsTextFieldViewModifier())
                TextField("Enter your user name", text: $vm.userName)
                    .modifier(ThreadsTextFieldViewModifier())
            }
            Button {
                Task { try await vm.createUser() }
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsCommonButtonViewModifier())
                    .padding(.vertical)
            }
            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)

        }
    }
}

#Preview {
    RegistrationView()
}
