//
//  PatientMetrics_InfoPatient.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 12/11/24.
//

import SwiftUI

struct PatientMetrics_InfoPatient: View {
    @Binding var viewModel: InfoPatientVM
    var body: some View {
        HStack {
            Text("Height (cm)")
            Spacer()
            TextField("Height", value: $viewModel.model.patient.height, format: .number)
#if IOS
                .keyboardType(.numberPad)
#endif
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 100)
        }
        
        HStack {
            Text("Weight (kg)")
            Spacer()
            TextField("Weight", value: $viewModel.model.patient.weight, format: .number)
#if IOS
                .keyboardType(.numberPad)
#endif
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 100)
        }
    }
}

#Preview {
    PatientMetrics_InfoPatient(viewModel: .constant(.init(patient: .init(name: "Jairo"))))
}
