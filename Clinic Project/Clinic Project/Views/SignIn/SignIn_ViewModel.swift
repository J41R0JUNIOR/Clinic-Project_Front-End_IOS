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
 
    func signIn() async {
        print("o")
        await interactor.authenticateUser(username: username, password: password) { result in
            switch result {
            case .success(let user):
                print("Usuário autenticado com sucesso: \(user)")
            case .failure(let error):
                print("Erro na autenticação: \(error.localizedDescription)")
            }
        }
    }
}

