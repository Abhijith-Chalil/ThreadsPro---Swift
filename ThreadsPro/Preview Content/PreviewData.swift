//
//  PreviewData.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 06/04/25.
//

import Foundation
import Firebase

class PreviewData {
    static let user = UserModel(
        id: UUID().uuidString,
        fullName: "Abhijith Dev",
        email: "abhijith@example.com",
        userName: "abhi_dev",
        bio: "iOS enthusiast and Flutter ninja.",
        profileImageUrl: "https://randomuser.me/api/portraits/men/1.jpg"
    )
    
    static let mockUsers: [UserModel] = [
        UserModel(
            id: UUID().uuidString,
            fullName: "Abhijith Dev",
            email: "abhijith@example.com",
            userName: "abhi_dev",
            bio: "iOS enthusiast and Flutter ninja.",
            profileImageUrl: "https://randomuser.me/api/portraits/men/1.jpg"
        ),
        UserModel(
            id: UUID().uuidString,
            fullName: "Sara Johnson",
            email: "sara.johnson@example.com",
            userName: "sara_j",
            bio: "Coffee lover ☕ | UI/UX Designer",
            profileImageUrl: "https://randomuser.me/api/portraits/women/2.jpg"
        ),
        UserModel(
            id: UUID().uuidString,
            fullName: "John Doe",
            email: "john.doe@example.com",
            userName: "johnny",
            bio: "Building cool things with SwiftUI!",
            profileImageUrl: "https://randomuser.me/api/portraits/men/3.jpg"
        ),
        UserModel(
            id: UUID().uuidString,
            fullName: "Emily Chen",
            email: "emily.chen@example.com",
            userName: "em_chen",
            bio: nil,
            profileImageUrl: nil
        )
    ]
    
    static let thread = Thread(ownerUid: UUID().uuidString, caption: "Test thread caption", timestamp: Timestamp(), likes: 0)
    
    static let threads = [
        Thread(ownerUid: UUID().uuidString, caption: "Test thread 1", timestamp: Timestamp(), likes: 5),
        Thread(ownerUid: UUID().uuidString, caption: "Another interesting post", timestamp: Timestamp(), likes: 10),
        Thread(ownerUid: UUID().uuidString, caption: "Third test thread caption", timestamp: Timestamp(), likes: 2)
    ]
    
}
