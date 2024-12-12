//
//  SignIn_ViewModel.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

class SignIn_ViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var message: String = ""
    
    private var interactor: SignIn_Interactor?
    
    init() {
        let presenter = SignIn_Presenter(viewModel: self)
        self.interactor = SignIn_Interactor(presenter: presenter)
    }
    
    func signIn() {
        interactor?.signIn(username: username, password: password)
    }
}
