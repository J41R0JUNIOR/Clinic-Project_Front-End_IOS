//
//  PatientMetricsSection.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 03/11/24.
//

import SwiftUI

struct PatientMetrics_CreatePatient: View {
    @Binding var patient: Patient

    var body: some View {
        HStack {
            Text("Height (cm)")
            TextField("Enter height", value: $patient.height, format: .number)
            #if IOS
                .keyboardType(.numberPad)
            #endif
                .textFieldStyle(.roundedBorder)
        }
        
        HStack {
            Text("Weight (kg)")
            TextField("Enter weight", value: $patient.weight, format: .number)
            #if IOS
                .keyboardType(.numberPad)
            #endif
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    PatientMetrics_CreatePatient(patient: .constant(.init(id: "1234567890", name: "John Doe")))
}
