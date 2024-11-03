//
//  PatientDetails.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import SwiftUI

struct PatientDetailsSection: View {
    @Binding var patient: Patient
    
    var body: some View {
     
            HStack {
                Text("Name")
                TextField("Enter name", text: Binding(
                    get: { patient.name ?? "" },
                    set: { patient.name = $0 }
                ))
                .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Birth Date")
                DatePicker("Select date", selection: Binding(
                    get: { patient.birthDateAsDate },
                    set: { patient.birthDateAsDate = $0 }
                ), displayedComponents: .date)
                .labelsHidden()
            }
            
            HStack {
                Text("Health Service Number")
                TextField("Enter health service number", text: Binding(
                    get: { patient.healthServiceNumber ?? "" },
                    set: { patient.healthServiceNumber = $0 }
                ))
                .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Phone Number")
                TextField("Enter phone number", text: Binding(
                    get: { patient.phoneNumber ?? "" },
                    set: { patient.phoneNumber = $0 }
                ))
                .keyboardType(.phonePad)
                .textFieldStyle(.roundedBorder)
            }
    }
}

#Preview {
    PatientDetailsSection(patient: .constant(.init(id: "1234567890", name: "John Doe")))
}
