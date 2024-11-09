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
    
    func updatePatient(method: CodeUrl) {
        Task {
            if let patientID = model.patient.id {
                try await model.api.updateData(dataToBeUpdated: model.patient, urlString: URLs.updatePatient(id: patientID, method: method).url)
                
                if let updatedPatient: Patient = try await model.api.getDataById(urlString: URLs.getPatientById(id: patientID, method: method).url) {
                    DispatchQueue.main.async {
                        self.model.patient = updatedPatient
                    }
                }
            }
        }
    }
    
    func calculateAge(from birthDate: Date) -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year ?? 0
    }
}
