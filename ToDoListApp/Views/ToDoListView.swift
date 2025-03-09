//
//  ToDoListView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @Environment(ToDoListViewModel.self) var viewModel
    @FirestoreQuery var items: [ToDoListItem]
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .environment(ToDoListItemViewModel())
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    .foregroundStyle(.red)
                            }

                        }
                }
                .listStyle(PlainListStyle())
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
    ToDoListView(userId: "pSarC39MX8dLhR7iPzwVGcHFajH3")
        .environment(ToDoListViewModel())
}
