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
            ToDoListView()
        } else {
            LoginView()
                .environment(LoginViewModel())
        }
    }
}

#Preview {
    MainView()
        .environment(MainViewModel())
}
