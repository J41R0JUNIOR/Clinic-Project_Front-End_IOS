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
        VStack{
            Text(viewModel.model.api.error)

            HStack {
                Spacer()
                Button("Cancel") {
                    viewModel.model.api.clearError()
                    viewModel.model.router.pop()
                }
                .tint(.red)
                
                Button("Create") {
                    viewModel.model.api.clearError()
                    viewModel.createPatient(method: .production)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

#Preview {
    CreatePatient()
}
