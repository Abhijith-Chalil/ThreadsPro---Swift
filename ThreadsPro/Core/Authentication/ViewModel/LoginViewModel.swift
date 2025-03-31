//
//  LoginViewModel.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""

    
    @MainActor
    func loginUser() async throws {
        print("DEBUG: Creating user...")
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
