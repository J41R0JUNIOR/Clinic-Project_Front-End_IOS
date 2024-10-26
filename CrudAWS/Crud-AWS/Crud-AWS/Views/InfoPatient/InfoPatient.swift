import SwiftUI

struct InfoPatient: View {
    @State var patientInfo: Patient
    @Bindable var router = Router.shared
    @Bindable private var api = Api.shared
    
    var body: some View {
        
        Form {
            Section(header: Text("Patient Details").font(.headline)) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text(patientInfo.name ?? "No name")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Health Service Number")
                    Spacer()
                    Text(patientInfo.healthServiceNumber ?? "Not provided")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Phone Number")
                    Spacer()
                    Text(patientInfo.phoneNumber ?? "Not provided")
                        .foregroundColor(.secondary)
                }
            }
            
            Section(header: Text("Physical Metrics").font(.headline)) {
                HStack {
                    Text("Age")
                    Spacer()
                    TextField("Age", value: $patientInfo.age, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 100)
                }
                
                HStack {
                    Text("Height (cm)")
                    Spacer()
                    TextField("Height", value: $patientInfo.height, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 100)
                }
                
                HStack {
                    Text("Weight (kg)")
                    Spacer()
                    TextField("Weight", value: $patientInfo.weight, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 100)
                }
            }
            
        }
        .navigationTitle("Patient Info")
        .padding()
    
        VStack{
            Button {
                
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                
                Task {
                    if let patientID = patientInfo.id {
                        try await api.updatePatient(id: patientID, patient: patientInfo)
                        
                        if let updatedPatient: Patient = try await api.getPatientById(id: patientID) {
                            DispatchQueue.main.async {
                                self.patientInfo = updatedPatient
                            }
                        }
                    }
                }
            } label: {
                Text("Update Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.blue)
          
            
            Button {
                Task {
                    try await api.deletePatient(id: patientInfo.id!)
                    router.pop()
                }
            } label: {
                Text("Delete Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.red)
         
        }  .buttonStyle(.borderedProminent).padding()
    }
}

#Preview {
    InfoPatient(patientInfo: .init(id: UUID().uuidString, name: "Jairo", age: 21, healthServiceNumber: "231jl32", phoneNumber: "61999022023", height: 177, weight: 70))
}
