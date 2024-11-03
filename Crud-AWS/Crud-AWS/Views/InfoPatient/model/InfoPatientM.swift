//
//  PatientListM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import Foundation

@Observable
class InfoPatientM {
    var patient: Patient
    var router = Router.shared
    var api = Api.shared
    
    init(patient: Patient) {
        self.patient = patient
    }
}
