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
    private var interactor = SignIn_Interactor()
 
    func signIn() {
         interactor.signIn(username: username, password: password)
       }
}

