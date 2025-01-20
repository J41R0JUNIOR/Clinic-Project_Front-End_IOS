//
//  AccessTokens.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 20/01/25.
//

import Foundation

@Observable
class AccessTokens {
    static var shared = AccessTokens()
    
    var user: Model.SignInReturn?
}
