//
//  SignIn_ViewModel.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation
import SwiftData

@Observable
class SignIn_ViewModel {
    var username: String = ""
    var password: String = ""
    var message: String = ""
    var rememberMe: Bool = false
    var state: State = AppState.shared.state
    
    var interactor: SignIn_Interactor?
    var router: Routes?
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(for: Model.LoginUserSwiftData.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print("Error initializing ModelContainer: \(error)")
        }
    }
    
    
    func signIn() {
        interactor?.signIn(username: username, password: password, rememberMe: rememberMe)
    }
    
    func tryAutoSignIn(){
        interactor?.tryAutoSignIn()
    }
    
    func handleStateChange() {
        if state == .logged {
            router?.navigate(to: .setting)
        }
    }
}
