//
//  File.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

class SignIn_Interactor {
    private var worker: SignInWorker
    private var presenter: SignInPresenterProtocol
    
    init(worker: SignInWorker = .init(), presenter: SignInPresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func signIn(username: String, password: String) {
        print("Autenticando usuário...")
        
        worker.authenticateUser(username: username, password: password) { result in
            switch result {
            case .success(let user):
                self.presenter.userSignInSuccess(user: user)
            case .failure(let error):
                self.presenter.userSignInFailure(error: error)
            }
        }
    }
}
