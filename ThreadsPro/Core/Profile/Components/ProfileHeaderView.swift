//
//  ProfileHeaderView.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 06/04/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: UserModel
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullName)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user.userName)
                        .font(.subheadline)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                Text("2 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            CircularProfileImgeView(user: user, size: .medium)
        }
    }
}

#Preview {
    ProfileHeaderView(user: PreviewData.user)
}
