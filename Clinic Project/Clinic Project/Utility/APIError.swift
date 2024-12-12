//
//  ShowError.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

enum APIError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidBody
}
