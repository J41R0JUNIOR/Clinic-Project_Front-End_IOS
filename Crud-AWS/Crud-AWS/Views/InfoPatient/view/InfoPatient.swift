import SwiftUI

struct InfoPatient: View {
    @State var viewModel: InfoPatientVM
    
    init(patient: Patient){
        self.viewModel = .init(patient: patient)
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Patient Details").font(.headline)) {
                PatientDetail_InfoPatient(viewModel: $viewModel)
            }
            
            Section(header: Text("Physical Metrics").font(.headline)) {
                PatientMetrics_InfoPatient(viewModel: $viewModel)
            }
        }
        .navigationTitle("Patient Info")
        .padding()
        
        VStack {
            Button {
#if IOS
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
#endif
                
                viewModel.updatePatient(method: .production)
                
            } label: {
                Text("Update Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.blue)
            
            Button {
                viewModel.deletePatient()
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
