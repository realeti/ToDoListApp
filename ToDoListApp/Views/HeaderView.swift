//
//  HeaderView.swift
//  ToDoList
//
//  Created by realeti on 05.03.2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 330)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(
        title: "To Do List",
        subtitle: "Get things done",
        angle: 15,
        background: .pink
    )
}
