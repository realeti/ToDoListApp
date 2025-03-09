//
//  NewItemView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct NewItemView: View {
    @Environment(NewItemViewModel.self) var viewModel
    @Binding var newItemPresented: Bool
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(
                    title: "Save",
                    background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(
                "Error",
                isPresented: $viewModel.showAlert,
                actions: {
                    Button("OK") {}
                },
                message: {
                    Text("Please fill in all fields and select due dat that is today or newer.")
                }
            )
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
        .environment(NewItemViewModel())
}
