//
//  PatientListVM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import Foundation

@Observable
class PatientListVM {
    var model = PatientListM()
    
     func loadPatients() async {
         Task{
             do {
                 if let patients: [Patient] = try await model.api.getAllData(urlString: URLs.getAllPatients.url){
                     self.model.patientsLoaded = patients
                 }
                 model.isLoading = false
             } catch {
                 model.errorMessage = error.localizedDescription
                 model.isLoading = false
             }
         }
    }
}
