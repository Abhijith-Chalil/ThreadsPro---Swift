//
//  ContentView.swift
//  ThreadsPro
//
//  Created by Abhijith Chalil on 29/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        Group {
            if vm.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
