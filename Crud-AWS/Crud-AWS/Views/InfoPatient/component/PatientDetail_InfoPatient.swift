//
//  PatientInfo.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 12/11/24.
//

import SwiftUI

struct PatientDetail_InfoPatient: View {
    @Binding var patient: Patient
    @Bindable var viewModel: PatientDetail_InfoPatientVM = .init()
    var body: some View {
        HStack {
            Text("Name")
            Spacer()
            
            TextField( "", text: Binding(
                get: { patient.name! },
                set: { patient.name = $0 }
            ))
        }
        
        HStack {
            Text("Health Service Number")
            Spacer()
            Text(patient.healthServiceNumber ?? "Not provided")
                .foregroundColor(.secondary)
        }
        
        HStack {
            Text("Phone Number")
            Spacer()
            TextField( "", text: Binding(
                get: { patient.phoneNumber ?? "" },
                set: { patient.phoneNumber = $0 }
            )).keyboardType(.phonePad)
        }
        
        HStack {
            Text("Age")
            Spacer()
            Text("\(viewModel.calculateAge(from: patient.birthDateAsDate)) years")
                .foregroundColor(.secondary)
        }
        
        HStack {
            Text("Birth Date")
            Spacer()
            DatePicker("Select date", selection: $patient.birthDateAsDate, displayedComponents: .date)
                .labelsHidden()
        }
    }
   
}

#Preview {
    PatientDetail_InfoPatient(patient: .constant(.init(name: "Jairo")))
}
