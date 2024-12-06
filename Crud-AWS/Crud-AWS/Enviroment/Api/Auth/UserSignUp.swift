//
//  User.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import Foundation

struct SignUpUser: Codable {
    var clientId: String
    var username: String
    var password: String?
    var email: String?
    var code: String?
}

