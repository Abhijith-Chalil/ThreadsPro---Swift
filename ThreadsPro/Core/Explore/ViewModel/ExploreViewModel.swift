//
//  ExploreViewModel.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 02/04/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [UserModel]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
