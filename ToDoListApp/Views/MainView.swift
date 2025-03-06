//
//  MainView.swift
//  ToDoListApp
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        LoginView()
            .environment(LoginViewModel())
    }
}

#Preview {
    MainView()
}
