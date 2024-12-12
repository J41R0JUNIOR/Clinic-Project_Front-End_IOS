//
//  SignIn.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel: SignIn_ViewModel
    
    var body: some View {
        Spacer()
        
        VStack{ 
            TextField("Email", text: $viewModel.username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            TextField("Password", text: $viewModel.password)
        }.padding()
        
        Button("Sign In"){
            viewModel.signIn()
            
        }.buttonStyle(.borderedProminent)
        
        Spacer()
        
        HStack{
            Text("Don't have an account?")
            Button("Sign Up") {
                
            }
        }
        
    }
}

#Preview {
    SignInView(viewModel: .init())
}
