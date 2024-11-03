//
//  PatientListVM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import Foundation

@Observable
class InfoPatientVM {
    var model: InfoPatientM
    
    init(patient: Patient) {
        self.model = .init(patient: patient)
    }
    
    func updatePatient() {
        Task {
            if let patientID = model.patient.id {
                try await model.api.updateData(dataToBeUpdated: model.patient, urlString: URLs.updatePatient(id: patientID).url)
                
                if let updatedPatient: Patient = try await model.api.getDataById(urlString: URLs.getPatientById(id: patientID).url) {
                    DispatchQueue.main.async {
                        self.model.patient = updatedPatient
                    }
                }
            }
        }
    }
}
