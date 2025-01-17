//
//  AppState.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 16/01/25.
//

import Foundation

@Observable
class AppState{
    static var shared = AppState()
    
    var state: State = .signOut
}
