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
                
                HStack{
                    Button {
                        viewModel.rememberMe.toggle()
                    } label: {
                        HStack {
                            Image(systemName: viewModel.rememberMe ? "checkmark.square.fill" : "square")
                                .foregroundColor(viewModel.rememberMe ? .blue : .gray)
                                .font(.system(size: 15))
                        }
                    }
                    
                    Text("Remember Me")
                        .foregroundColor(.primary)
                        .font(.subheadline)
                    
                    Spacer()
                }.padding()
                
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
                
                Rectangle().opacity(0.6).ignoresSafeArea()
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
