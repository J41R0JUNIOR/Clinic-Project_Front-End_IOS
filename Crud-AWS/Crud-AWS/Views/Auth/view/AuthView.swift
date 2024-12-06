//
//  AuthView.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import SwiftUI

struct AuthView: View {
    @Bindable var viewModel: AuthVM = .init()
    
    var body: some View {
        VStack{
            Text("Login Page").font(.system(size: 30, weight: .bold))
           
            
            if viewModel.model.signIn{
                SignIn(viewModel: viewModel)
            }else{
                SignUp(viewModel: viewModel)
            }
            
        }.textFieldStyle(.roundedBorder)
            .padding()
    }
}

#Preview {
    AuthView()
}
