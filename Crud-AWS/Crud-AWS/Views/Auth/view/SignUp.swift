//  SignUp.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import SwiftUI

struct SignUp: View {
    @Bindable var viewModel: AuthVM

    var body: some View {
        VStack {
            Spacer()

            TextField("Email", text: $viewModel.model.username)
                .autocapitalization(.none)
                .disableAutocorrection(true)

            SecureField("Password", text: $viewModel.model.password)
            SecureField("Confirm Password", text: $viewModel.model.passwordConfirm)

            if viewModel.model.showPasswordMismatchMessage {
                Text("The password must be the same")
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Button("Sign Up") {
                if viewModel.model.password == viewModel.model.passwordConfirm {
                    viewModel.signUp()
                    viewModel.model.showPasswordMismatchMessage = false
                } else {
                    viewModel.model.showPasswordMismatchMessage = true
                }
            }
            .buttonStyle(.borderedProminent)

            Spacer()

            Text("Already have an account?")
            Button("Sign In") {
                viewModel.model.signIn = true
            }
        }
        .sheet(isPresented: $viewModel.model.alert) {
            VStack(spacing: 16) {
                Text("Confirm the code")
                    .font(.headline)

                TextField("Insert confirmation code:", text: $viewModel.model.confirmationCode)
                    .textFieldStyle(.roundedBorder)

                Button("Confirm") {
                    viewModel.signUpVerification()
                }
                .buttonStyle(.borderedProminent)

                Button("Cancel") {
                    viewModel.model.alert = false
                }
                .foregroundStyle(.red)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    SignUp(viewModel: .init())
}
