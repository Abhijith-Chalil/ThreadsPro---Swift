//
//  User.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 31/03/25.
//

import Foundation

struct UserModel: Identifiable, Codable {
    
    let id: String
    let fullName: String
    let email: String
    let userName: String
    var bio: String?
    var profileImageUrl: String?
}
