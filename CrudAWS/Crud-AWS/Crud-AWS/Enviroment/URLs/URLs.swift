//
//  URLs.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 26/10/24.
//

import Foundation

enum URLs: String {
    case getAllPatients = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients/allPatients"
    case createPatient = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients"
    case getPatientById = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patient/"
    case updatePatient = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients/"
}
