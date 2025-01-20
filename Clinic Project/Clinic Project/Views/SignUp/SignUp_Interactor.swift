//
//  SignUp_Interactor.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 17/01/25.
//

import Foundation

protocol SignUp_Interactor_Protocol {
    
}
 
class SignUp_Interactor: SignUp_Interactor_Protocol, InteractorProtocol {
    private var authWorker: SighUp_Worker = .init()
    var presenter: SignUp_Presenter
    
    required init(presenter: SignUp_Presenter) {
        self.presenter = presenter
    }
}
