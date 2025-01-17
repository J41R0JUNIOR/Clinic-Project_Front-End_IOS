//
//  SignUp_View.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 17/01/25.
//

import SwiftUI

struct SignUp_View: View {
    @Bindable var viewModel: SignUp_ViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Sign Up").font(.title)
                Spacer()
            }
            
            Spacer()
            
            HStack{
                Button {
                    viewModel.backToSignIn()
                    
                } label: {
                    HStack{
                        Spacer()
                        Text("Cancel")
                            .foregroundStyle(.red)
                        Spacer()
                    }
                }
                .buttonStyle(.bordered)
                
                Button {
                } label: {
                    HStack{
                        Spacer()
                        Text("Confirm")
                        Spacer()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        
        .padding()
    }
}

#Preview {
    SignUp_View(viewModel: .init())
}
