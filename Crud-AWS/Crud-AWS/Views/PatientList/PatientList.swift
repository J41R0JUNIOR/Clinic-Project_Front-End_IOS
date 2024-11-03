import SwiftUI

struct PatientList: View {
    @Bindable private var api = Api.shared
    @Bindable var router = Router.shared
    @State private var isLoading = true
    @State private var errorMessage: String?
    
    @State var patientsLoaded: [Patient] = []
    
    var body: some View {
        VStack {
            Text("Patients list")
                .font(.headline)
                     
            Spacer()
            
            if isLoading {
                ProgressView("Loading...")
                
                Spacer()
                
            } else if let errorMessage = errorMessage {
                Text("Erro: \(errorMessage)")
                    .foregroundColor(.red)
                
            } else {
                List(patientsLoaded) { patient in
                    Button{
                        router.push(.patientDetails(patient))
                    } label: {
                        HStack{
                            VStack{
                                Text(patient.name ?? "Nome indisponível")
                                Text(patient.phoneNumber ?? "").font(.caption)
                            }
                        }
                    }
                }
                .refreshable(action: {
                    await loadPatients()
                })
                .listStyle(PlainListStyle())
            }
            
            Button {
                router.push(.createPatient)
            } label: {
                Text("Create Patient")
                    .frame(maxWidth: .infinity)
            }
            .tint(.blue)
            .buttonStyle(.borderedProminent)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    
                }label: {
                    Image(systemName: "plus")
                }
            }
        })
        
        
        
        .onAppear {
            Task {
                await loadPatients()
            }
        }
        .onDisappear {
            Task {
                await loadPatients()
            }
        }
        .padding()
    }
    
    private func loadPatients() async {
        do {
            if let patients: [Patient] = try await api.getAllData(urlString: URLs.getAllPatients.url){
                self.patientsLoaded = patients
            }
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}

#Preview {
    NavigationStack{
        PatientList().environmentObject(Router.shared)
    }
}
