//
//  ProfileView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct ProfileView: View {
    @Environment(ProfileViewModel.self) var viewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .environment(ProfileViewModel())
}
