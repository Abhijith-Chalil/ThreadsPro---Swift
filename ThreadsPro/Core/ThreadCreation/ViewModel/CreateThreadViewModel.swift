//
//  CreateThreadViewModel.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 19/04/25.
//

import FirebaseAuth
import Firebase


class CreateThreadViewModel: ObservableObject {

    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread( ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
    
}
