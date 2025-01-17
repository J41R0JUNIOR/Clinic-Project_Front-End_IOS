//
//  File.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

protocol SignIn_Interactor_Protocol {
    func signIn(username: String, password: String, rememberMe: Bool)
    func tryAutoSignIn()
}

class SignIn_Interactor: SignIn_Interactor_Protocol {
    
    private var authWorker: SignIn_Worker
    var presenter: SignIn_Presenter_Protocol
    
    init(authWorker: SignIn_Worker = .init(), presenter: SignIn_Presenter_Protocol) {
        self.authWorker = authWorker
        self.presenter = presenter
    }
    
    func haveEmailAndPassword(username: String, password: String) -> Bool{
        if username.isEmpty || username.contains("@gmail.com") == false{
            let noUsersError = NSError(
                domain: "CheckEmail",
                code: 404,
                userInfo: [NSLocalizedDescriptionKey: "Missing email"]
            )
            self.presenter.userSignInFailure(error: noUsersError)
            
            return false
        }
        
        if  password.isEmpty {
            let noUsersError = NSError(
                domain: "CheckPassword",
                code: 404,
                userInfo: [NSLocalizedDescriptionKey: "Missing password"]
            )
            self.presenter.userSignInFailure(error: noUsersError)
            
            return false
        }
        
        return true
    }
    
    func signIn(username: String, password: String, rememberMe: Bool = false) {
        
        if !haveEmailAndPassword(username: username, password: password) {
            return
        }
        
        authWorker.authenticateUser(username: username, password: password) { result in
            switch result {
            case .success(let user):
                
                self.presenter.userSignInSuccess(user: user)
                
                if rememberMe{
                    SwiftDataService.shared.deleteAll()
                    SwiftDataService.shared.save(login: .init(username: username, password: password, accessToken: "", idToken: "", refreshToken: ""))
                }
                
            case .failure(let error):
                print("error \(error)")
                
                let noUsersError = NSError(
                    domain: "Sign",
                    code: 404,
                    userInfo: [NSLocalizedDescriptionKey: "Email or Password incorrect"]
                )
                self.presenter.userSignInFailure(error: noUsersError)
            }
        }
    }
    
    func tryAutoSignIn() {
        SwiftDataService.shared.fetch { result in
            switch result {
            case .success(let users):
                if let firstUser = users.first {
                    self.signIn(username: firstUser.username, password: firstUser.password)
                    return
                }
                
                self.presenter.userSignInFailure()
            case .failure(let error):
                print("Error looking for users: \(error)")
                
                self.presenter.userSignInFailure(error: error)
            }
        }
    }
}
