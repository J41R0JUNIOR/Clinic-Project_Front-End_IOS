//
//  Auth.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 05/12/24.
//

import Foundation

enum AuthState {
    case signedOut
    case signedIn
    case signUpNotVerified
    case signUpVerified
}

extension Api {
    
    func signUp(user: SignUpUser) async throws {
        let urlString = URLs.authSignUp(method: .production).url
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let user = encode(content: user)
        
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.post.rawValue
        request.httpBody = user
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if handleError(data: data).contains("Concluded Sign Up"){
            self.state = .signUpNotVerified
        }
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
            error = handleError(data: data)
            throw APIError.invalidResponse
        }
    }
    
    func sighUpConfirmation(user: SignUpUser) async throws {
        let urlString = URLs.authSignUpConfirmation(method: .production).url
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let user = encode(content: user)
        
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.post.rawValue
        request.httpBody = user
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if handleError(data: data).contains("User confirmed successfully"){
            self.state = .signUpVerified
        }
                
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
            error = handleError(data: data)
            throw APIError.invalidResponse
        }
    }
}
