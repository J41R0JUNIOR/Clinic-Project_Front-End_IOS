//
//  MarkUp.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 17/01/25.
//

import SwiftUI

struct MarkUp_Component: View {
    @Binding var rememberMe: Bool
    var text: String
    var body: some View {
        HStack{
            Button {
                rememberMe.toggle()
            } label: {
                HStack {
                    Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                        .foregroundColor(rememberMe ? .blue : .gray)
                        .font(.system(size: 15))
                }
            }
            
            Text("Remember Me")
                .foregroundColor(.primary)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

#Preview {
    MarkUp_Component(rememberMe: .constant(true), text: "Remember Me")
}
