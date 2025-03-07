//
//  MainView.swift
//  ToDoListApp
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct MainView: View {
    @Environment(MainViewModel.self) var viewModel
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
                .environment(LoginViewModel())
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                ToDoListView(userId: viewModel.currentUserId)
                    .environment(ToDoListViewModel())
            }
            
            Tab("Profile", systemImage: "person.circle") {
                ProfileView()
                    .environment(ProfileViewModel())
            }
        }
    }
}

#Preview {
    MainView()
        .environment(MainViewModel())
}
