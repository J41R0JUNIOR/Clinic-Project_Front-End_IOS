//
//  SignIn.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import SwiftUI

struct SignInView: View {
    @Bindable var viewModel: SignIn_ViewModel
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Sign In").font(.title)
                    Spacer()
                }
                Spacer()
                
                HStack{
                    Text("Email:")
                    Spacer()
                }
                
                TextField("Type your email", text: $viewModel.username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
                    .textFieldStyle(.roundedBorder)
                
                HStack{
                    Text("Password:")
                    Spacer()
                }
                
                SecureField("type your password", text: $viewModel.password).textContentType(.password)
                    .textFieldStyle(.roundedBorder)
                
                MarkUp_Component(rememberMe: $viewModel.rememberMe, text: "Remember me")
                
                Spacer()
                
                Button {
                    viewModel.signIn()
                } label: {
                    HStack{
                        Spacer()
                        Text("Sign In")
                        Spacer()
                    }
                }.buttonStyle(.borderedProminent)
                
                HStack{
                    Text("Don't have an account?")
                    Button("Sign Up") {
                        viewModel.signUp()
                    }
                }
            }
            .padding()
            .task{
                viewModel.tryAutoSignIn()
            }
            .onChange(of: viewModel.state, { _, _ in
                viewModel.handleStateChange()
            })
            
            
            if viewModel.isRefreshing {
                Rectangle()
                    .opacity(0.7)
                    .ignoresSafeArea()
                    .foregroundStyle(.black)
                
                ProgressView("Loading...")
                    .tint(.white)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SignInView(viewModel: .init())
}
