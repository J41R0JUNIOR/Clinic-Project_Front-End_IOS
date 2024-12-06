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
    
    func signUp(user: User) async throws {
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
        
        if messageReceived(data: data).contains("Concluded Sign Up"){
            self.state = .signUpNotVerified
        }
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
            error = messageReceived(data: data)
            throw APIError.invalidResponse
        }
    }
    
    func signUpConfirmation(user: User) async throws {
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
        
        if messageReceived(data: data).contains("User confirmed successfully"){
            self.state = .signUpVerified
        }
                
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
            error = messageReceived(data: data)
            throw APIError.invalidResponse
        }
    }
    
    func signIn(user: User) async  throws {
        let urlString = URLs.authSignIn(method: .production).url
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let user = encode(content: user)
        
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.post.rawValue
        request.httpBody = user
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if messageReceived(data: data).contains("User signed in successfully"){
            self.state = .signedIn
            print(messageReceived(data: data))
        }
                
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
            error = messageReceived(data: data)
            throw APIError.invalidResponse
        }
        
        self.token = try decode(content: data)
        
        
    }
}
