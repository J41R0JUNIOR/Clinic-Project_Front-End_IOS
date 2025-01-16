//
//  SignInInterator.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

public protocol SignInPresenterProtocol {
    func userSignInSuccess(user: Model.SignInReturn)
    func userSignInFailure(error: Error)
    func noUserSaved()
}

public class SignIn_Presenter: @preconcurrency SignInPresenterProtocol {
    public weak var viewModel: SignIn_ViewModel?
    
    public init(viewModel: SignIn_ViewModel) {
        self.viewModel = viewModel
    }
    
    @MainActor
    public func userSignInSuccess(user: Model.SignInReturn) {
        self.viewModel?.message = "Usuário autenticado com sucesso!"
        self.viewModel?.state = .logged
        
    }
    
    @MainActor
    public func userSignInFailure(error: Error) {
        self.viewModel?.message = error.localizedDescription
        
    }
    
    @MainActor
    public func noUserSaved() {
        self.viewModel?.message = "Nenhum usuário salvo!"
        
    }
}
