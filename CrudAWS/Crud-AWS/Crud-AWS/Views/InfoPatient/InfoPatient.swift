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
//                HStack {
//                    Text("Age")
//                    Spacer()
//                    Text("\(calculateAge(from: patientInfo.birthDate ?? .now)) years")
//                        .foregroundColor(.secondary)
//                }
                
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
        
        VStack {
            Button {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                
                Task {
                    if let patientID = patientInfo.id {
                        try await api.updateData(dataToBeUpdated: patientInfo, urlString: "\(URLs.updatePatient.rawValue)\(patientID)")
                        
                        if let updatedPatient: Patient = try await api.getDataById(urlString: "\(URLs.getPatientById.rawValue)/\(patientID)") {
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
                    try await api.deleteData(urlString: "\(URLs.getPatientById.rawValue)\(patientInfo.id!)")
                }
                router.pop()
            } label: {
                Text("Delete Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.red)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    // Função para calcular a idade com base na data de nascimento
    private func calculateAge(from birthDate: Date) -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year ?? 0
    }
}

#Preview {
    InfoPatient(patientInfo: .init(id: UUID().uuidString, name: "Jairo", healthServiceNumber: "231jl32", phoneNumber: "61999022023", height: 177, weight: 70))
}
