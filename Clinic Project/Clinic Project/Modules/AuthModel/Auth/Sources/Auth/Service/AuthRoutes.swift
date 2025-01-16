//
//  Routes.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 13/12/24.
//

import Foundation
import UIKit
import SwiftUI

public enum Destination {
    case signIn
    //    case doctorContent
}

public protocol AuthNavigationDelegate: AnyObject {
    func backToMainRoutes()
}

@MainActor
public class AuthRoutes: AuthNavigationDelegate {
    nonisolated public func backToMainRoutes() {
        print("opa fi")
    }
    
    let navigationController: UINavigationController
    public weak var delegate: AuthNavigationDelegate?
    
    public init(navigationController: UINavigationController, delegate: AuthNavigationDelegate? = nil) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
    
    public func start() {
        navigate(to: .signIn)
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .signIn:
            let view = createSignInModule()
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
}
