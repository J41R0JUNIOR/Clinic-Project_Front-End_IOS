import SwiftUI

struct PatientList: View {
    @Bindable var viewModel = PatientListVM()
    
    var body: some View {
        VStack {
            Text("Patients list")
                .font(.headline)
            
            Spacer()
            
            if viewModel.model.isLoading {
                ProgressView("Loading...")
                
                Spacer()
                
            } else if let errorMessage = viewModel.model.errorMessage {
                Text("Erro: \(errorMessage)")
                    .foregroundColor(.red)
                
            } else {
                List(viewModel.model.patientsLoaded) { patient in
                    Button{
                        viewModel.model.router.push(.patientDetails(patient))
                    } label: {
                        VStack{
                            Text(patient.name ?? "Nome indisponível")
                            Text(viewModel.formatPhoneNumber(patient.phoneNumber ?? ""))
                                .font(.subheadline)

                                
                        }
                    }
                }
                .refreshable(action: {
                    await viewModel.loadPatients()
                })
                .listStyle(PlainListStyle())
            }
            
            Button {
                viewModel.model.router.push(.createPatient)
            } label: {
                Text("Create Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.blue)
            .buttonStyle(.borderedProminent)
        }
//        .toolbar(content: {
//            ToolbarItem(placement: .topBarTrailing) {
//                Button{
//                    
//                }label: {
//                    Image(systemName: "plus")
//                }
//            }
//        })
        
        .task {
            await viewModel.loadPatients()
        }
        
        .padding()
    }
}

#Preview {
    NavigationStack{
        PatientList().environmentObject(Router.shared)
    }
}
