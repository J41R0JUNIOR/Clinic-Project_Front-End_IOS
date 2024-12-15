//
//  SignInInterator.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

protocol SignInPresenterProtocol {
    func userSignInSuccess(user: Model.SignInReturn)
    func userSignInFailure(error: Error)
    func noUserSaved()
}

class SignIn_Presenter: SignInPresenterProtocol {
    weak var viewModel: SignIn_ViewModel?
    
    init(viewModel: SignIn_ViewModel) {
        self.viewModel = viewModel
    }
    
    func userSignInSuccess(user: Model.SignInReturn) {
        DispatchQueue.main.async {
            self.viewModel?.isAuthenticated = true
            self.viewModel?.message = "Usuário autenticado com sucesso!"
            
        }
    }
    
    func userSignInFailure(error: Error) {
        DispatchQueue.main.async {
            self.viewModel?.isAuthenticated = false
            self.viewModel?.message = error.localizedDescription
        }
    }
    
    func noUserSaved() {
        DispatchQueue.main.async {
            self.viewModel?.isAuthenticated = false
            self.viewModel?.message = "Nenhum usuário salvo!"
        }
    }
}
