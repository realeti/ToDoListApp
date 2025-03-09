//
//  ToDoListView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct ToDoListView: View {
    @Environment(ToDoListViewModel.self) var viewModel
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
                    .environment(NewItemViewModel())
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
        .environment(ToDoListViewModel())
}
