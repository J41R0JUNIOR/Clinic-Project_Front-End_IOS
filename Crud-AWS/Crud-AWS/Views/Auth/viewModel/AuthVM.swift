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
                
                let user = User(clientId: ClientId.clientId.rawValue, username: model.username, password: model.password, email: model.username)
                try await model.api.signUp(user: user)
                
                if model.api.state == .signUpNotVerified {
                    model.alert = true
                }
            }
        }
    }
    
    func signUpVerification() {
        Task {
            do{
                model.api.error = ""
                model.api.state = .signedOut
                
                let user = User(clientId: ClientId.clientId.rawValue, username: model.username, code: model.confirmationCode)
                try await model.api.signUpConfirmation(user: user)
                
                if model.api.state == .signUpVerified {
                    model.alert = false
                    model.signIn = true
                }
            }
        }
    }
    
    func signIn(){
        Task{
            do{
                model.api.error = ""
                model.api.state = .signedOut
                
                let user = User(clientId: ClientId.clientId.rawValue, username: model.username, password: model.password)
                
               try await model.api.signIn(user: user)
                
                if model.api.state == .signedIn {
                    model.alert = false
                    model.signIn = true
//                    model.router.push(.content)
                    model.router.pop()
                }
            }
        }
    }
}
