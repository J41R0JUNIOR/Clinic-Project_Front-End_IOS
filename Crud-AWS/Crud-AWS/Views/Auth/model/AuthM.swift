//
//  AuthM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import Foundation

@Observable
class AuthM {
    var username: String = ""
    var password: String = ""
    var passwordConfirm: String = ""
    
    var api = Api.shared
    var router = Router.shared
    
    var signIn: Bool = true
    var showPasswordMismatchMessage = false
    var alert: Bool = false
    var confirmationCode: String = ""

}
