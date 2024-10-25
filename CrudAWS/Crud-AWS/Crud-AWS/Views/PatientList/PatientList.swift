import SwiftUI

struct PatientList: View {
    @Bindable private var api = CallApi.shared
    @EnvironmentObject var router: Router
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
                        
                    } label: {
                        Text(patient.name ?? "Nome indisponível")
                            .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear {
            Task {
                await loadPatients()
            }
        }
        .padding()
    }

    private func loadPatients() async {
        do {
            try await api.getAllPatients()
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
