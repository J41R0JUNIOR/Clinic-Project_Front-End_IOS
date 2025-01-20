//
//  AllPatients_View.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 20/01/25.
//

import SwiftUI

struct AllPatients_View: View {
    @Bindable var viewModel: AllPatients_ViewModel
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            viewModel.getAllPatients()
        }
    }
}

#Preview {
    AllPatients_View(viewModel: .init())
}
