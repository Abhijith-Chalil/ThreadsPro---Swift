//
//  AuthService.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do {
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Created user with email: \(result.user.uid)")
            
        } catch {
            print("DEBUG: Error while creating user: \(error.localizedDescription)")
        }
    }
}
