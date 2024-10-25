//
//  SwiftUIView.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

import SwiftUI

struct PatientList: View {
    @StateObject var api = CallApi.shared
    var body: some View {
        VStack {
            
            List(api.patients){ patient in
                Text(patient.name ?? "none")

            }
        }.onAppear{
            Task {
                try await api.getAllPatients()
            }
            
        }
        .padding()
    }
}

#Preview {
    PatientList()
}
