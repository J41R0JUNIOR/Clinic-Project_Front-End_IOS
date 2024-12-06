//
//  AuthVM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import Foundation

@Observable
class AuthVM{
    var model: AuthM = .init()
    
    func signUp() {
        Task {
            do{
                model.api.error = ""
                
                let user = SignUpUser(clientId: ClientId.clientId.rawValue, username: model.username, password: model.password, email: model.username)
                try await model.api.signUp(user: user)
                
                if model.api.state == .signUpNotVerified {
                    model.alert = true
                }
            }
        }
    }
    
    func sighUpVerification() {
        Task {
            do{
                model.api.error = ""
                model.api.state = .signedOut
                
                let user = SignUpUser(clientId: ClientId.clientId.rawValue, username: model.username, code: model.confirmationCode)
                try await model.api.sighUpConfirmation(user: user)
                
                if model.api.state == .signUpVerified {
                    model.alert = false
                    model.signIn = true
                }
            }
        }
    }
}
