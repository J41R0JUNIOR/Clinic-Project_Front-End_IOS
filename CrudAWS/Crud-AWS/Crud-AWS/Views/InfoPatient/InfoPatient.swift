//
//  InfoPatient.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

import SwiftUI

struct InfoPatient: View {
    @State var patientInfo: Patient
    @Bindable var router = Router.shared
    @Bindable private var api = CallApi.shared
    
    var body: some View {
        VStack{
            Text(patientInfo.name ?? "No name")
            Spacer()
            
            HStack {
                Text("Age: \(patientInfo.age ?? 0)")
                Text("Height: \(patientInfo.height ?? 0)")
                Text("Weight: \(patientInfo.weight ?? 0)")
            }
            
            Text("Health Service Number: \(patientInfo.healthServiceNumber ?? "")")
            Text("Phone Number: \(patientInfo.phoneNumber ?? " ")")
            
            Spacer()
            
            Button("Delete Patient") {
                Task {
                    try await api.deletePatient(id: patientInfo.id!)
                }
                do {
                    router.pop()
                }
            }.buttonStyle(.borderedProminent)
                .tint(.red)
        }
    }
}

#Preview {
    InfoPatient(patientInfo: .init(id: UUID().uuidString, name: "Jairo", age: 21, healthServiceNumber: "231jl32", phoneNumber: "61999022023", height: 177, weight: 70))
}
