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
    
    func signIn(username: String, password: String, rememberMe: Bool = false) {
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
                self.presenter.userSignInFailure(error: error)
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
                
                let noUsersError = NSError(
                    domain: "AutoSignIn",
                    code: 404,
                    userInfo: [NSLocalizedDescriptionKey: "No users found in the database."]
                )
                self.presenter.userSignInFailure(error: noUsersError)
            case .failure(let error):
                print("Error looking for users: \(error)")
                self.presenter.userSignInFailure(error: error)
            }
        }
    }
}
