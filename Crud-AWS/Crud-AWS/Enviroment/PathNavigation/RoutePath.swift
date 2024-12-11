import SwiftUI

public struct RoutePath: Hashable { 
    var route: Routes
    
    init(_ route: Routes) {
        self.route = route
    }
    
    @ViewBuilder
    func findPath() -> some View {
        switch route {
        case .none:
            EmptyView()
        case .content:
            ContentView().navigationBarBackButtonHidden()
        case .patientList:
            PatientList().navigationBarBackButtonHidden()
        case .patientDetails(let patientInfo):
            InfoPatient(patient: patientInfo)
        case .createPatient:
            CreatePatient()
        case .auth:
            AuthView().navigationBarBackButtonHidden()
        }
    }
}
