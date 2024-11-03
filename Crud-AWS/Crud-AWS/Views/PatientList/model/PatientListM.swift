//
//  PatientListM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import Foundation

@Observable
class PatientListM {
    var api = Api.shared
    var router = Router.shared
    var isLoading = true
    var errorMessage: String?
    var patientsLoaded: [Patient] = []
}
