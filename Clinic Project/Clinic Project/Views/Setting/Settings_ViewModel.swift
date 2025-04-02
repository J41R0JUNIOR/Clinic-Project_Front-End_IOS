//
//  Settings_ViewModel.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 16/01/25.
//

import Foundation
import Auth_Aws_Package

@Observable
@MainActor
class Settings_ViewModel {
    var router: Routes?
    
    @MainActor func backToSignIn() {
        SwiftDataService.shared.deleteAll()
        AppState.shared.state = .signOut
        
        router?.navigate(to: .auth, .pop)
    }
}
