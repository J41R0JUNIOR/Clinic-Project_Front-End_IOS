//
//  ContentView.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var api: CallApi
    var body: some View {
        PatientList()
    }
}

#Preview {
    ContentView().environmentObject(CallApi())
}
