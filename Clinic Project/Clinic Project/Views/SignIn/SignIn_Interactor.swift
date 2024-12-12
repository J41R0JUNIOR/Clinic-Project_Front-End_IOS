//
//  File.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

class SignIn_Interactor{
    private var worker: SignInWorker
    
    init(worker: SignInWorker = .init()) {
        self.worker = worker
    }
    
    func authenticateUser(username: String, password: String, completion: @escaping (Result<Model.SignInReturn, Error>) -> Void) async {
        
        do{
            let signInReturn = try  await worker.signIn(user: Model.User(clientId: ClientId.clientId.rawValue, username: username, password: password)) ?? .init(accessToken: "", idToken: "", refreshToken: "")
            completion(.success(signInReturn))
        } catch {
            completion(.failure(error))
        }
    }
}

protocol SignInWorkerProtocol {
    func signIn(user: Model.SignInReturn) async  throws
}

struct SignInWorker {
    
    func signIn(user: Model.User) async throws -> Model.SignInReturn? {
        let urlString = URLs.authSignIn.url
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let user = Utility.shared.encode(content: user)
        
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.post.rawValue
        request.httpBody = user
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
            throw APIError.invalidResponse
        }
        
        let returned: Model.SignInReturn? = try Utility.shared.decode(content: data)
        
        return returned
    }
}
