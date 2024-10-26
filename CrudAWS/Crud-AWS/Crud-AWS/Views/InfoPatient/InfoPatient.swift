import Foundation
import SwiftUI

struct InfoPatient: View {
    @State var patientInfo: Patient
    @Bindable var router = Router.shared
    @Bindable private var api = CallApi.shared
    
    
    var body: some View {
        VStack {
            Text(patientInfo.name ?? "No name")
            Spacer()
            HStack{
                Text("Age")
                TextField("\(patientInfo.age ?? 0)", value: $patientInfo.age, format: .number)
                    .keyboardType(.numberPad)
            }
            
            HStack{
                Text("Height")
                TextField("\(patientInfo.height ?? 0)", value: $patientInfo.height, format: .number)
                    .keyboardType(.numberPad)
            }
            
            HStack{
                Text("Weight")
                TextField("\(patientInfo.weight ?? 0)", value: $patientInfo.weight, format: .number)
                    .keyboardType(.numberPad)
            
            }
            
            
            Text("Health Service Number: \(patientInfo.healthServiceNumber ?? "")")
            Text("Phone Number: \(patientInfo.phoneNumber ?? " ")")
            
            Spacer()
            Button {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                Task {
                    if let patientID = self.patientInfo.id{
                        try await api.updatePatient(id: patientID, patient: patientInfo)
                        
                        self.patientInfo = try await api.getPatientById(id: patientID)
                    }
                }
            } label: {
                Text("Update Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.blue)
            .buttonStyle(.borderedProminent)
            
            Button {
                Task {
                    try await api.deletePatient(id: patientInfo.id!)
                }
                do {
                    router.pop()
                }
            } label: {
                Text("Delete Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.red)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    InfoPatient(patientInfo: .init(id: UUID().uuidString, name: "Jairo", age: 21, healthServiceNumber: "231jl32", phoneNumber: "61999022023", height: 177, weight: 70))
}
