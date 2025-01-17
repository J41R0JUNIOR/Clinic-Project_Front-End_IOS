//
//  Intermediate_View.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 16/01/25.
//

import SwiftUI

struct Settings_View: View {
    @Bindable var viewModel: Settings_ViewModel
    
    var body: some View {
        VStack{
            Text("Setting").font(.title)
            
            Spacer()
            
            Button {
                viewModel.backToSignIn()
            } label: {
                Text("Log out")
            }
        }
    }
}

#Preview {
    Settings_View(viewModel: .init())
}
