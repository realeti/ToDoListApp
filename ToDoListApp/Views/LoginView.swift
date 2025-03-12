//
//  LoginView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    @State private var registerViewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Header
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    angle: 15,
                    background: .pink
                )
                
                // MARK: - Login Form
                Form {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage.message)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        background: .blue,
                        action: {
                            viewModel.login()
                        }
                    )
                    .padding()
                }
                .offset(y: -50)
                
                // MARK: - Create Account
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create An Account") {
                        RegisterView()
                            .environment(registerViewModel)
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
