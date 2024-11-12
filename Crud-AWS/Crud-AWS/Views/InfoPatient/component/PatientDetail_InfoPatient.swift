//
//  PatientInfo.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 12/11/24.
//

import SwiftUI

struct PatientDetail_InfoPatient: View {
    @Binding var viewModel: InfoPatientVM
    var body: some View {
        HStack {
            Text("Name")
            Spacer()
            
            TextField( viewModel.model.patient.name!, text: Binding(
                get: { viewModel.model.patient.name! },
                set: { viewModel.model.patient.name = $0 }
            ))
        }
        
        HStack {
            Text("Health Service Number")
            Spacer()
            Text(viewModel.model.patient.healthServiceNumber ?? "Not provided")
                .foregroundColor(.secondary)
        }
        
        HStack {
            Text("Phone Number")
            Spacer()
            Text(viewModel.model.patient.phoneNumber ?? "Not provided")
                .foregroundColor(.secondary)
        }
        
        HStack {
            Text("Age")
            Spacer()
            Text("\(viewModel.calculateAge(from: viewModel.model.patient.birthDateAsDate)) years")
                .foregroundColor(.secondary)
        }
        
        HStack {
            Text("Birth Date")
            Spacer()
            DatePicker("Select date", selection: $viewModel.model.patient.birthDateAsDate, displayedComponents: .date)
                .labelsHidden()
        }
    }
}

#Preview {
    PatientDetail_InfoPatient(viewModel: .constant(.init(patient: .init(name: "John Doe"))))
}
