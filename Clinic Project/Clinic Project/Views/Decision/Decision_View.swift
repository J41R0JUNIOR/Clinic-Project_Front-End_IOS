//
//  Decision_View.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 24/03/25.
//

import SwiftUI

struct Decision_View: View {
    @State var router: Routes
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
        }.onAppear {
            router.navigate(to: .auth, .push)
        }
    }
}

#Preview {
    Decision_View(router: .init(navigationController: .init()))
}
