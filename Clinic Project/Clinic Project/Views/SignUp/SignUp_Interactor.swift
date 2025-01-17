//
//  SignUp_Interactor.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 17/01/25.
//

import Foundation

protocol SignUp_Interactor_Protocol {
    
}
 
class SignUp_Interactor: SignUp_Interactor_Protocol {
    private var authWorker: SighUp_Worker
    var presenter: SignUp_Presenter_Protocol
    
    init(authWorker: SighUp_Worker = .init(), presenter: SignUp_Presenter_Protocol) {
        self.authWorker = authWorker
        self.presenter = presenter
    }
}
