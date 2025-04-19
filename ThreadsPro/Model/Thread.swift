//
//  Thread.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 19/04/25.
//

import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: UserModel?
}
