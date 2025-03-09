//
//  MainView.swift
//  ToDoListApp
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct MainView: View {
    @Environment(MainViewModel.self) var viewModel
    @State private var toDoListViewModel = ToDoListViewModel()
    @State private var profileViewModel = ProfileViewModel()
    
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
                    .environment(toDoListViewModel)
            }
            
            Tab("Profile", systemImage: "person.circle") {
                ProfileView()
                    .environment(profileViewModel)
            }
        }
    }
}

#Preview {
    MainView()
        .environment(MainViewModel())
}
