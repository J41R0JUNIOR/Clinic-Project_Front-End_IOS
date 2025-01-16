//
//  SignIn_ViewModel.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation
import SwiftData


@Observable
public class SignIn_ViewModel {
    var username: String = ""
    var password: String = ""
    var message: String = ""
    var rememberMe: Bool = false
    var state: State = .signOut
    
    public var interactor: SignIn_Interactor?
    public var router: AuthRoutes?
    var container: ModelContainer?
    var context: ModelContext?
    
    
    
    public init() {
        do {
            container = try ModelContainer(for: Model.LoginUserSwiftData.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print("Error initializing ModelContainer: \(error)")
        }
    }
    
    @MainActor func signIn() {
        interactor?.signIn(username: username, password: password, rememberMe: rememberMe)
    }
    
    @MainActor func tryAutoSignIn() {
        interactor?.tryAutoSignIn()
    }
    
    @MainActor func handleStateChange() {
        if state == .logged {
            print("logou handleStateChange")
            router?.delegate?.backToMainRoutes()
            
        }
    }
}
