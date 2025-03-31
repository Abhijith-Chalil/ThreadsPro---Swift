//
//  AuthService.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            print("DEBUG: Creating user from servies...")
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await  UserService.shared.fetchCurrentUser()
            print("DEBUG: Created user from servies...")
        } catch {
            print("DEBUG: Error while login user: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do {
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullName: fullName, userName: userName, id: result.user.uid)
            print("DEBUG: Created user with email: \(result.user.uid)")
            
        } catch {
            print("DEBUG: Error while creating user: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.resetUser()
    }
    
    @MainActor
    func uploadUserData(withEmail email: String,fullName: String, userName: String, id: String) async throws {
        let user = UserModel(id: id, fullName: fullName, email: email, userName: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
}
