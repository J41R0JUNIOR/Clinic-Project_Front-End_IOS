//
//  SignIn.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import SwiftUI

struct SignIn: View {
    @Bindable var viewModel: AuthVM
    var body: some View {
        VStack{
            Spacer()
            TextField("Username", text: $viewModel.model.username)
            TextField("Password", text: $viewModel.model.password)
            
            Button("Sign In"){
            }.buttonStyle(.borderedProminent)
            
            Spacer()
            
            HStack{
                Text("Don't have an account?")
                Button("Sign Up") {
                    viewModel.model.signIn = false
                }
            }
        }
    }
}

#Preview {
    SignIn(viewModel: .init())
}
