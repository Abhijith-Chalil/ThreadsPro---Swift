//
//  UserCell.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 30/03/25.
//

import SwiftUI

struct UserCell: View {
    
    let user: UserModel
    
    var body: some View {
        HStack {
            CircularProfileImgeView(user: user,size: .small)
            VStackLayout(alignment: .leading) {
                Text(user.userName)
                    .fontWeight(.semibold)
                
                Text(user.fullName)
            }
            .font(.footnote)
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
    }
}

#Preview {
    UserCell(user: PreviewData.user)
}
