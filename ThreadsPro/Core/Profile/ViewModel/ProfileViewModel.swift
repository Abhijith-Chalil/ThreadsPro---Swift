//
//  ProfileViewModel.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import Foundation
import Combine


class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: UserModel?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: user from profile view model: \(user)")
        }.store(in: &cancellables)
    }
}
