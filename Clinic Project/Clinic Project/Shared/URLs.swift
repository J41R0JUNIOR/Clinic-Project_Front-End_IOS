//
//  URLs.swift
//  Crud-AWS
//
//  Created by The Godfather Júnior on 10/12/24.
//

import Foundation

public enum BaseUrl: String {
    case aws = "https://oortbbeqid.execute-api.us-east-1.amazonaws.com/dev/"
}

public enum URLs {
    case authSignUp
    case authSignIn
    case confirmSignUp
    
    case createPatient
    case updatePatient(id: String)
    case deletePatient(id: String)
    case getPatientById(id: String)
    case findAllPatients
    
    var url: String {
        
        switch self {
        case .authSignUp:
            return "\(BaseUrl.aws.rawValue)signUp"
            
        case .authSignIn:
            return "\(BaseUrl.aws.rawValue)signIn"
            
        case .confirmSignUp:
            return "\(BaseUrl.aws.rawValue)confirmSighUp"
            
            
        case .updatePatient(let id):
            return "\(BaseUrl.aws.rawValue)patients/\(id)"
            
        case .deletePatient(let id):
            return "\(BaseUrl.aws.rawValue)patient\(id)"
            
        case .getPatientById(let id):
            return "\(BaseUrl.aws.rawValue)patient\(id)"
            
        case .findAllPatients:
            return "\(BaseUrl.aws.rawValue)patients/allPatients"
            
        case .createPatient:
            return "\(BaseUrl.aws.rawValue)patients"
        }
    }
}

public enum ClientId: String {
    case clientId = "69ei4lganceag4esfpf26e58g3"
}

public enum MethodApi: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
