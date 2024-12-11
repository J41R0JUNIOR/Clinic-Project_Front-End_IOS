//
//  ContentView.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    @Bindable var router = Router.shared
    
    var body: some View {
        VStack{
            
        }
      
        .task {
            print("opaodaosfaps")
            if Api.shared.state == .signedIn {
                router.push(.patientList)
                print("epa")
            }else{
                
                print("opa")
                router.push(.auth)
            }
        }
     
    }
}

#Preview {
    ContentView()
        .environmentObject(Router.shared)
}
