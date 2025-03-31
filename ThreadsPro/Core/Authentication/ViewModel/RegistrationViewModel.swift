//
//  RegistrationViewModel.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: Creating user...")
       try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName, userName: userName)
    }
}
