//
//  ViewProtocol.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 20/01/25.
//

import Foundation
import SwiftUI

protocol ViewProtocol: View {
    associatedtype VM: ViewModelProtocol
    var viewModel: VM { get set }
    init (viewModel: VM)
}

protocol ViewModelProtocol: Observable {
    associatedtype T: InteractorProtocol
    var interactor: T? { get set }
    var router: Routes? { get set }
    init ()
}

protocol InteractorProtocol {
    associatedtype P: PresenterProtocol
    var presenter: P { get set }
    init (presenter: P)
}

protocol PresenterProtocol {
    associatedtype VM: ViewModelProtocol
    var viewModel: VM? { get set }
    init (viewModel: VM)
}
