//
//  ContentViewModel.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import Foundation
import FirebaseAuth
import Combine


class ContentViewModel: ObservableObject {
    @Published var userSession: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        print("DEBUG: setupSubscribers called")
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
            print("DEBUG: userSession from setupSubscribers \(userSession?.uid ?? "nil")")
        }.store(in: &cancellables)
    }
}
