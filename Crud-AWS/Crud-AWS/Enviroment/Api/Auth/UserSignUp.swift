//
//  User.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import Foundation

struct User: Codable {
    var clientId: String
    var username: String
    var password: String?
    var email: String?
    var code: String?
}

struct SignInResponse: Decodable {
    var accesToken: String
    var refreshToken: String
    var idToken: String
}
