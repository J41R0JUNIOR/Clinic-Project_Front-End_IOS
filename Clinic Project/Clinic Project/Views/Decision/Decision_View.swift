//
//  Decision_View.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 24/03/25.
//

import SwiftUI
import Auth_Aws_Package

struct Decision_View: View {
    @State var router: Routes
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
        }.onAppear {
            if(AppState.shared.state == .signOut){
                router.navigate(to: .auth, .push)
            }
        }.navigationBarBackButtonHidden(true) 
            .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    Decision_View(router: .init(navigationController: .init()))
}
