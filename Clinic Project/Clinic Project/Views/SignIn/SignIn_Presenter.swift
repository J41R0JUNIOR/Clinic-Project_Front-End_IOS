//
//  SignInInterator.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

protocol SignIn_Presenter_Protocol {
    func userSignInSuccess(user: Model.SignInReturn)
    func userSignInFailure(error: Error)
    func noUserSaved()
} 

class SignIn_Presenter: SignIn_Presenter_Protocol {
    weak var viewModel: SignIn_ViewModel?
    
    init(viewModel: SignIn_ViewModel) {
        self.viewModel = viewModel
    }
    
    func userSignInSuccess(user: Model.SignInReturn) {
        DispatchQueue.main.async {
            self.viewModel?.message = "Usuário autenticado com sucesso!"
            self.viewModel?.state = .logged
        }
    }
    
    func userSignInFailure(error: Error) {
        DispatchQueue.main.async {
            self.viewModel?.message = error.localizedDescription
            self.viewModel?.isRefreshing = false
        }
    }
    
    func noUserSaved() {
        DispatchQueue.main.async {
            self.viewModel?.message = "Nenhum usuário salvo!"
        }
    }
}
