//
//  FeedView.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 30/03/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @StateObject private var vm = ProfileViewModel()
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    private var currentUser: UserModel? {
        return vm.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.fullName ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.userName ?? "")
                                    .font(.subheadline)
                            }
                            if let bio = currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                            Text("2 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        CircularProfileImgeView()
                    }
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                    
                                }
                            }
                        }
                        LazyVStack {
                            ForEach(0...10,id: \.self) { thread in
                                ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView()
}
