import SwiftUI

struct CreatePatient: View {
    
    @State var viewModel = CreatePatientVM()
    
    var body: some View {
        
        Form{
            Section(header: Text("Patient Details").font(.headline)){
                PatientDetailsSection(patient: $viewModel.model.patient)
            }
            
            Section(header: Text("Physical Metrics").font(.headline)) {
                PatientMetricsSection(patient: $viewModel.model.patient)
            }
     
        }
        HStack {
            Spacer()
            
            Button("Cancel") {
                viewModel.model.router.pop()
            }
            .tint(.red)
            
            Button("Create") {
                viewModel.createPatient(method: .production)
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

#Preview {
    CreatePatient()
}
