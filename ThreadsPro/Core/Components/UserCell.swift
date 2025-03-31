//
//  UserCell.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 30/03/25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImgeView()
            VStackLayout(alignment: .leading) {
                Text("Abhijith Chalil")
                    .fontWeight(.semibold)
                
                Text("Mobile App Developer")
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
    UserCell()
}
