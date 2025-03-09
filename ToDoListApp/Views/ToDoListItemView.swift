//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct ToDoListItemView: View {
    @Environment(ToDoListItemViewModel.self) var viewModel
    let item: ToDoListItem
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.blue)
            }
            .buttonStyle(.borderless)
        }
    }
}

#Preview {
    ToDoListItemView(item:
        ToDoListItem(
            id: "1",
            title: "Title",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true
        )
    )
    .environment(ToDoListItemViewModel())
}
