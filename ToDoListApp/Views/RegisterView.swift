//
//  RegisterView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct RegisterView: View {
    @Environment(RegisterViewModel.self) var registerViewModel
    
    var body: some View {
        @Bindable var registerViewModel = registerViewModel
        
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "Start organizing todos",
                angle: -15,
                background: .orange
            )
            
            Form {
                TextField("Full Name", text: $registerViewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $registerViewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                SecureField("Full Name", text: $registerViewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    background: .green,
                    action: {
                        // Attempt registration
                    }
                )
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
        .environment(RegisterViewModel())
}
