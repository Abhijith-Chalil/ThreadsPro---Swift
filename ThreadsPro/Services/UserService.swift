//
//  UserService.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class UserService {
    @Published var currentUser: UserModel?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        print("DEBUG: fetching current user from UserService for uid: \(uid)")
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: UserModel.self)
        self.currentUser = user
        dump(user)
    }
    
    func resetUser(){
        self.currentUser = nil
    }
}

