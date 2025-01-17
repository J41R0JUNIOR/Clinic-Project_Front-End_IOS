//
//  SignUp_ViewModel.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 17/01/25.
//

import Foundation

@Observable
class SignUp_ViewModel {
    var interactor: SignUp_Interactor?
    var router: Routes?
    
    func backToSignIn() {
        router?.navigate(to: .signIn)
    }
}
