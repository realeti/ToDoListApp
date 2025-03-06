//
//  TLButton.swift
//  ToDoList
//
//  Created by realeti on 06.03.2025.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(
        title: "Value",
        background: .blue,
        action: {}
    )
}
