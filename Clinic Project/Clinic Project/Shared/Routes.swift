//
//  Routes.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 13/12/24.
//

import Foundation
import UIKit
import SwiftUI

enum Destination {
    case signIn
    case doctorContent
    case setting
}

class Routes {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigate(to: .signIn)
    }
    
    func navigate(to destination: Destination) {
        navigationController.viewControllers.removeAll()
        
        switch destination {
        case .signIn:
            let view = createSignInModule()
            navigationController.pushViewController(view, animated: true)

        case .doctorContent:
            let view = createDoctorContentModule()
            navigationController.pushViewController(view, animated: true)
            
        case .setting:
            let view = createSettingModule()
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    func createSignInModule() -> UIViewController {
        let viewModel = SignIn_ViewModel()
        let viewController = UIHostingController(rootView: SignInView(viewModel: viewModel))
        let presenter = SignIn_Presenter(viewModel: viewModel)
        let interactor = SignIn_Interactor(presenter: presenter)
        
        viewModel.interactor = interactor
        viewModel.router = self
        presenter.viewModel = viewModel
        interactor.presenter = presenter
        
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
