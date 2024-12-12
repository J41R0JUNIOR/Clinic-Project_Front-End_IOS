//
//  File.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

class SignIn_Interactor {
    private var worker: SignInWorker
    private var presenter: SignIn_Presenter
    
    init(worker: SignInWorker = .init(), presenter: SignIn_Presenter = .init()) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func signIn(username: String, password: String) {
        print("Autenticando usuário...")
        
        worker.authenticateUser(username: username, password: password) { result in
            switch result {
            case .success(let user):
                print("Usuário autenticado com sucesso: \(user)")
                self.presenter.userSignInSuccess(user: user)
                
            case .failure(let error):
                print("Erro na autenticação: \(error.localizedDescription)")
//                self.presenter.userSignInFailure(error: error)
            }
        }
    }
}
