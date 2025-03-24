//
//  Settings_ViewModel.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 16/01/25.
//

import Foundation

@Observable
class Settings_ViewModel {
    var state: State = AppState.shared.state
    var router: Routes?
    
    func backToSignIn() {
        SwiftDataService.shared.deleteAll()
        state = .signOut
        
        router?.navigate(to: .auth, .pop)
    }
}
