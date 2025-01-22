//
//  CustomAlert.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 20/01/25.
//

import SwiftUI

struct CustomCodeAlert: View {
    @Binding var signUpCode: String
    @Binding var showAlert: Bool
    var sendCode: () -> Void
    var resendCode: () -> Void
    
    var body: some View {
        ZStack{
            Rectangle()
                .opacity(0.9)
                .ignoresSafeArea()
                .foregroundStyle(.black)
            
            VStack{
                Spacer()
                HStack{
                    Text("Set the code:")
                        .foregroundStyle(.white)
                    
                    TextField("", text: $signUpCode)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .border(Color.white, width: 0.5)
                }
                
                HStack{
                    Spacer()
                    
                    Button {
                        resendCode()
                        
                    } label: {
                        Text("send again")
                    }
                }
                
                Spacer()
                
                Button {
                    sendCode()
                    
                } label: {
                    HStack{
                        Spacer()
                        Text("Send")
                        Spacer()
                    }
                }
                .buttonStyle(.borderedProminent)
            }.padding()
        }
    }
}

#Preview {
    CustomCodeAlert(signUpCode: .constant("210834"), showAlert: .constant(true), sendCode: {}, resendCode: {})
}
