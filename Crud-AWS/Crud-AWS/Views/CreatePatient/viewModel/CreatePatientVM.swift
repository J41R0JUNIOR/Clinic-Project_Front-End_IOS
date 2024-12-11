//
//  CreatePatientVM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import Foundation

@Observable
class CreatePatientVM {
    var model = CreatePatientM()
    
    func createPatient(){
        Task {
            try await model.api.createData(dataToCreate: model.patient, urlString: URLs.createPatient.url)
            model.router.pop()
        }
    }
}
