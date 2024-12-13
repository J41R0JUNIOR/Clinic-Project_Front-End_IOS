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
    
    var interactor: SignIn_Interactor?
    var router: Routes?
    
    func signIn() {
        interactor?.signIn(username: username, password: password)
    }
}
