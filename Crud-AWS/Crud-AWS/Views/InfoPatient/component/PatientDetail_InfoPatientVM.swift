//
//  PatientDetail_InfoPatientVM.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 12/11/24.
//

import Foundation

@Observable
class PatientDetail_InfoPatientVM {
    
    func calculateAge(from birthDate: Date) -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year ?? 0
    }
}
