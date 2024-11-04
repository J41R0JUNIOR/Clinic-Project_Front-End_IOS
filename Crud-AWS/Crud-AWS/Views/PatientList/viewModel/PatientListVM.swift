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
         model.patientsLoaded.removeAll()
         model.isLoading = true
         
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

    func formatPhoneNumber(_ phoneNumber: String) -> String {
        let digits = phoneNumber.filter { $0.isNumber }
        
        // Verifique se o número de dígitos é suficiente para a formatação
        guard digits.count >= 10 else { return phoneNumber }

        // Para números no formato: (XX) XXXXX-XXXX
        let areaCode = digits.prefix(2)
        let prefix = digits.dropFirst(2).prefix(5)
        let lineNumber = digits.dropFirst(7).prefix(4)
        
        return "(\(areaCode)) \(prefix)-\(lineNumber)"
    }


}
