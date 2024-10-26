import SwiftUI

struct CreatePatient: View {
    @Bindable private var api = Api.shared
    @Bindable var router = Router.shared

    @State private var name: String = ""
    @State private var age: Int = 0
    @State private var healthServiceNumber: String = ""
    @State private var phoneNumber: String = ""
    @State private var height: Int = 0
    @State private var weight: Int = 0

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Name")
                TextField("Enter name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Age")
                TextField("Enter age", value: $age, format: .number)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Health Service Number")
                TextField("Enter health service number", text: $healthServiceNumber)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Phone Number")
                TextField("Enter phone number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Height (cm)")
                TextField("Enter height", value: $height, format: .number)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Weight (kg)")
                TextField("Enter weight", value: $weight, format: .number)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Spacer()
                
                Button("Cancel") {
                    router.pop()
                }
                .tint(.red)
                
                Button("Create") {
                    Task {
                        let newPatient = Patient(
                            id: nil,
                            name: name,
                            age: age,
                            healthServiceNumber: healthServiceNumber,
                            phoneNumber: phoneNumber,
                            height: height,
                            weight: weight
                        )
                        try await api.createPatient(patient: newPatient)
                        router.pop()
                    }
                }
              
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    CreatePatient()
}
