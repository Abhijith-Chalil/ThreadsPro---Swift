//
//  FeedView.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 30/03/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject private var vm = ExploreViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(vm.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                .padding(.horizontal)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: UserModel.self) { user in
                ProfileView(user: user)
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
