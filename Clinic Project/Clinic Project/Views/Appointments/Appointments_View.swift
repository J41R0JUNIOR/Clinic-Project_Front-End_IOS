//
//  Appointments_View.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 16/12/24.
//

import SwiftUI

struct Appointments_View: View {
    @Bindable var viewModel: Appointments_ViewModel
    var body: some View {
        List{
            HStack{
                Image(systemName: "person")
                Text("Jairo")
            }
        }
    }
}

#Preview {
    Appointments_View(viewModel: .init())
}
