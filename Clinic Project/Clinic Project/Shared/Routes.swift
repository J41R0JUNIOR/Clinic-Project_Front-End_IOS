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
        switch destination {
        case .signIn:
            let travelViewController = createSignInModule()
            navigationController.pushViewController(travelViewController, animated: true)
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
}
