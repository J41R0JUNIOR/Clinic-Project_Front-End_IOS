//
//  URLs.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 26/10/24.
//

import Foundation

enum URLs {
    case getAllPatients
    case createPatient
    case getPatientById(id: String)
    case updatePatient(id: String)
    case deletePatient(id: String)
    
    var url: String {
        switch self {
        case .getAllPatients:
            return "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients/allPatients"
        case .createPatient:
            return "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients"
        case .getPatientById(let id):
            return "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patient//\(id)"
        case .updatePatient(let id):
            return "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients/\(id)"
        case .deletePatient(let id):
            return "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patient/\(id)"
        }
    }
}
