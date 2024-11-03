//
//  ContentView.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack{
            Button("Show Patients"){
                router.push(.patientList)
            }
            Button("Show Doctors"){
                
            }
        }.buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
        .environmentObject(Router.shared)
}
