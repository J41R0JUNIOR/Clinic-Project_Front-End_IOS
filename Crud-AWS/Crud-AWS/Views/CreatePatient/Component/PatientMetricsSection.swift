//
//  PatientMetricsSection.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import SwiftUI

struct PatientMetricsSection: View {
    @Binding var patient: Patient

    var body: some View {
        HStack {
            Text("Height (cm)")
            TextField("Enter height", value: $patient.height, format: .number)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
        }
        
        HStack {
            Text("Weight (kg)")
            TextField("Enter weight", value: $patient.weight, format: .number)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    PatientMetricsSection(patient: .constant(.init(id: "1234567890", name: "John Doe")))
}
