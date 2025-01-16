//
//  Routes.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 13/12/24.
//

import Foundation
import UIKit
import SwiftUI
import Auth

public enum Destination {
    case signIn
    case doctorContent
}

@MainActor
public class Routes: AuthNavigationDelegate {
    public func backToMainRoutes() {
        navigate(to: .doctorContent)
        print("chamou em")
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigate(to: .signIn)
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .signIn:
            let authRoutes = AuthRoutes(navigationController: navigationController, delegate: self)
            authRoutes.start()
            
        case .doctorContent:
            let view = createDoctorContentModule()
            navigationController.pushViewController(view, animated: true)
        }
    }

    
    func createSignInModule() -> UIViewController {
            let authRoutes = AuthRoutes(navigationController: navigationController)
            authRoutes.delegate = self  
            authRoutes.start()
            return UIViewController()
        }
    
    func createDoctorContentModule() -> UIViewController {
        let viewController = UIHostingController(rootView: DoctorContent_View().navigationBarBackButtonHidden())
        
        return viewController
    }
}
