import SwiftUI

struct InfoPatient: View {
    @State var viewModel: InfoPatientVM
    
    init(patient: Patient){
        self.viewModel = .init(patient: patient)
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Patient Details").font(.headline)) {
                PatientDetail_InfoPatient(patient: $viewModel.model.patient)
            }
            
            Section(header: Text("Physical Metrics").font(.headline)) {
                PatientMetrics_InfoPatient(viewModel: $viewModel)
            }
        }
        .navigationTitle("Patient Info")
        .padding()
        
        Text(viewModel.model.api.error)
        
        VStack {
            Button {

                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                viewModel.updatePatient(method: .production)
                viewModel.model.api.clearError()
                
            } label: {
                Text("Update Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.blue)
            
            Button {
                viewModel.deletePatient()
                viewModel.model.api.clearError()
            } label: {
                Text("Delete Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.red)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}


#Preview {
    InfoPatient(patient: .init(name: "John Doe"))
}
