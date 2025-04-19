//
//  ThreadService.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 19/04/25.
//

import Foundation
import Firebase
import FirebaseFirestore


struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp",descending: true).getDocuments()
        
        return snapshot.documents.compactMap { docs in
            try? docs.data(as: Thread.self)
        }
    }
}
