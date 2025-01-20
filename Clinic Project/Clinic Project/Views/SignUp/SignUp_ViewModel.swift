//
//  SignUp_ViewModel.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 17/01/25.
//

import Foundation

@Observable
class SignUp_ViewModel: ViewModelProtocol {
    var interactor: SignUp_Interactor?
    var router: Routes?
    
    required init() {}
    
    func backToSignIn() {
        router?.navigate(to: .signIn)
    }
}
