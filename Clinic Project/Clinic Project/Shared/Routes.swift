//
//  Routes.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 13/12/24.
//

import Foundation
import UIKit
import SwiftUI
import ViewProtocol_Package
import Auth_Aws_Package

@MainActor
class Routes: @preconcurrency RoutesProtocol {
    
    let navigationController: UINavigationController
//    let authRouter: Auth_Aws_Package.Routes

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
//        self.authRouter = Auth_Aws_Package.Routes(navigationController: navigationController)

    }
    
    public func start() {
           navigate(to: .auth, .push)
       }

    func navigate(to destination: Destination, _ type: TypeTransition = .push) {
           navigationController.viewControllers.removeAll()

           let transition = CATransition()
           transition.duration = 0.35
           transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
           transition.type = .moveIn
           transition.subtype = CATransitionSubtype(rawValue: type.rawValue)

           navigationController.view.layer.add(transition, forKey: nil)

           switch destination {
           case .doctorContent:
               let view = createDoctorContentModule()
               navigationController.pushViewController(view, animated: true)
               
           case .setting:
               let view = createSettingModule()
               navigationController.pushViewController(view, animated: true)

           case .auth:
               Auth_Aws_Package.Router.init(navigationController: navigationController).start()
           }
       }
    
    func createModule<V: ViewProtocol, R: RoutesProtocol>(viewType: V.Type, router: R) -> UIViewController
    where V.VM.I.P.VM == V.VM, V.VM.R == R {
        
        var viewModel = V.VM.init()
        let presenter = V.VM.I.P.init(viewModel: viewModel)
        let interactor = V.VM.I.init(presenter: presenter)
        
        viewModel.interactor = interactor
        viewModel.router = self as? R
        
        let view = V.init(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        return viewController
    }
    
    func createDoctorContentModule() -> UIViewController {
        let viewController = UIHostingController(rootView: DoctorContent_View().navigationBarBackButtonHidden())
        return viewController
    }
    
    func createSettingModule() -> UIViewController {
        let viewModel = Settings_ViewModel()
        viewModel.router = self
        let viewController = UIHostingController(rootView: Settings_View(viewModel: viewModel).navigationBarBackButtonHidden())
        
        return viewController
    }
}

public enum Destination {
    case doctorContent
    case setting
    case auth
}

