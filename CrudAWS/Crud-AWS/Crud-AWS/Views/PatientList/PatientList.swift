import SwiftUI

struct PatientList: View {
    @Bindable private var api = CallApi.shared
    @Bindable var router = Router.shared
    @State private var isLoading = true
    @State private var errorMessage: String?

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
                List(api.patients) { patient in
                    Button{
                        router.push(.patientDetails(patient))
                    } label: {
                        Text(patient.name ?? "Nome indisponível")
                            .padding(.vertical, 4)
                    }
                }
                .refreshable(action: {
                    await loadPatients()
                })
                .listStyle(PlainListStyle())
            }
            
            Button("Create Patient") {
                router.push(.createPatient)
            }
            .buttonStyle(.borderedProminent)
        }
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
            let _ = try await api.getAllPatients()
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}

#Preview {
    PatientList().environmentObject(Router.shared)
}
