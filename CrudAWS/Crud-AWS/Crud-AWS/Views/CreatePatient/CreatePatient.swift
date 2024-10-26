//
//  CreatePatient.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

import SwiftUI

struct CreatePatient: View {
    @Bindable private var api = CallApi.shared
    @Bindable var router = Router.shared
    
    @State var name: String = ""
    @State var age: Int = 0
  
    
    var body: some View {
        TextField("Name", text: $name)
//        TextField("Age", value: $age, format: .number)
        
        Button("Create") {
            Task {
                try await api.createPatient(patient: .init(name: name/*, age: age*/))
            }
            do{
                router.pop()
            }
        }
    }
}

#Preview {
    CreatePatient()
}
