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
    @State private var newItemViewModel = NewItemViewModel()
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
                let filteredItems = items.sorted(by: { $0.dueDate < $1.dueDate })
                List(filteredItems) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id, userId: userId)
                            }
                            .tint(Color.red)
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
                    .environment(newItemViewModel)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "pSarC39MX8dLhR7iPzwVGcHFajH3")
        .environment(ToDoListViewModel())
}
