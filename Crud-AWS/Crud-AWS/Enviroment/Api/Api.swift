//
//  Api.swift
//  Crud-AWS
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation
import SwiftUI

@Observable
class Api: ObservableObject {
    var state: AuthState = .signedOut
    
    static var shared = Api()
    
    var error: String = .init()
    
    var token: SignInResponse?

}
